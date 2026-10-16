<#
.SYNOPSIS
    Sync-ObsidianLesson.ps1 - Live session mirroring from Antigravity to Obsidian.
    Adapted from Amos Blomqvist's md-log extension.

.DESCRIPTION
    Monitors Antigravity conversation transcripts and streams formatted Markdown,
    LaTeX, Callouts, and Mermaid diagrams into a note inside your Obsidian Vault.
    Requires NO external dependencies - runs on native Windows PowerShell.

.PARAMETER VaultNotePath
    Path to the Markdown file inside the Obsidian vault (defaults to 'Lessons\Active-Lesson.md' in the repository root).

.PARAMETER ConversationId
    Optional conversation ID. If omitted, automatically detects the latest active conversation.

.PARAMETER Watch
    Continuously watch the transcript for updates and append them live to the Obsidian note.
#>

param(
    [Parameter(Mandatory = $false)]
    [string]$VaultNotePath = (Join-Path (Split-Path -Parent $PSScriptRoot) "Lessons\Active-Lesson.md"),

    [Parameter(Mandatory = $false)]
    [string]$ConversationId = "",

    [Parameter(Mandatory = $false)]
    [string]$Watch = "true"
)

# 1. Resolve Antigravity Base Path
$appData = [System.IO.Path]::Combine($env:USERPROFILE, ".gemini", "antigravity", "brain")
if (-not (Test-Path $appData)) {
    Write-Error "Antigravity data directory not found at $appData"
    return
}

# 2. Locate Active Transcript
if ([string]::IsNullOrWhiteSpace($ConversationId)) {
    # Find most recently modified conversation folder
    $latestConv = Get-ChildItem -Path $appData -Directory | 
                  Sort-Object LastWriteTime -Descending | 
                  Select-Object -First 1
    if (-not $latestConv) {
        Write-Error "No active Antigravity conversations found in $appData"
        return
    }
    $ConversationId = $latestConv.Name
}

$transcriptPath = Join-Path $appData "$ConversationId\.system_generated\logs\transcript.jsonl"
if (-not (Test-Path $transcriptPath)) {
    Write-Error "Transcript not found at $transcriptPath"
    return
}

# 3. Ensure Vault Directory Exists
$vaultDir = [System.IO.Path]::GetDirectoryName($VaultNotePath)
if (-not [string]::IsNullOrEmpty($vaultDir) -and -not (Test-Path $vaultDir)) {
    New-Item -ItemType Directory -Path $vaultDir -Force | Out-Null
}

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host " Antigravity -> Obsidian Live Session Mirror" -ForegroundColor Green
Write-Host " Conversation ID : $ConversationId" -ForegroundColor Yellow
Write-Host " Transcript      : $transcriptPath" -ForegroundColor DarkGray
Write-Host " Target Vault Note: $VaultNotePath" -ForegroundColor Yellow
Write-Host "==========================================================" -ForegroundColor Cyan

# Formatters for Obsidian Callouts
function Format-Callout {
    param([string]$Type, [string]$Title, [string]$Body)
    $lines = @("> [!$Type] $Title")
    foreach ($line in ($Body -split "`n")) {
        $trimmed = $line.TrimEnd("`r")
        if ($trimmed.Length -eq 0) {
            $lines += ">"
        } else {
            $lines += "> $trimmed"
        }
    }
    return ($lines -join "`n") + "`n`n"
}

# Track processed line count
$processedLines = 0
if (Test-Path $VaultNotePath) {
    # If starting fresh or backfilling
    Write-Host "Existing note found. Appending new session entries..." -ForegroundColor DarkYellow
} else {
    $header = "# Active Learning Session`n`n*Synced live from Google Antigravity on $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')*`n`n---`n`n"
    [System.IO.File]::WriteAllText($VaultNotePath, $header, [System.Text.Encoding]::UTF8)
}

function Process-NewLines {
    param([ref]$lineCounter)

    $allLines = Get-Content -Path $transcriptPath -Encoding UTF8 -ErrorAction SilentlyContinue
    if (-not $allLines) { return }

    $totalLines = $allLines.Count
    if ($totalLines -le $lineCounter.Value) { return }

    $newLines = $allLines[$lineCounter.Value..($totalLines - 1)]
    $lineCounter.Value = $totalLines

    $buffer = New-Object System.Text.StringBuilder

    foreach ($rawLine in $newLines) {
        if ([string]::IsNullOrWhiteSpace($rawLine)) { continue }
        try {
            $entry = $rawLine | ConvertFrom-Json
            
            # User Message
            if ($entry.source -eq "USER_EXPLICIT" -and $entry.type -eq "USER_INPUT") {
                $content = $entry.content
                # Strip system tags
                $clean = $content -replace "(?s)<USER_REQUEST>(.*?)</USER_REQUEST>", '$1'
                $clean = $clean -replace "(?s)<ADDITIONAL_METADATA>.*?</ADDITIONAL_METADATA>", ""
                $clean = $clean -replace "(?s)<USER_SETTINGS_CHANGE>.*?</USER_SETTINGS_CHANGE>", ""
                $clean = $clean.Trim()
                if ($clean.Length -gt 0) {
                    $block = Format-Callout -Type "quote" -Title "You" -Body $clean
                    [void]$buffer.Append($block)
                }
            }

            # Model Response (Assistant Prose)
            elseif ($entry.source -eq "MODEL" -and $entry.type -eq "PLANNER_RESPONSE") {
                if ($entry.content) {
                    $text = $entry.content.Trim()
                    if ($text.Length -gt 0) {
                        $block = Format-Callout -Type "abstract" -Title "Antigravity Tutor" -Body $text
                        [void]$buffer.Append($block)
                    }
                }

                # Tool Calls (e.g. ask_question)
                if ($entry.tool_calls) {
                    foreach ($tc in $entry.tool_calls) {
                        if ($tc.name -eq "ask_question" -or $tc.name -eq "quiz") {
                            $argsObj = $tc.args
                            if ($argsObj -is [string]) { $argsObj = $argsObj | ConvertFrom-Json }
                            
                            $qText = ""
                            $optText = ""
                            if ($argsObj.questions) {
                                foreach ($q in $argsObj.questions) {
                                    $qText += "$($q.question)`n"
                                    if ($q.options) {
                                        $i = 1
                                        foreach ($opt in $q.options) {
                                            $optText += "$i. $opt`n"
                                            $i++
                                        }
                                    }
                                }
                            } elseif ($argsObj.question) {
                                $qText = $argsObj.question
                                if ($argsObj.options) {
                                    $i = 1
                                    foreach ($opt in $argsObj.options) {
                                        $label = if ($opt.label) { $opt.label } else { $opt }
                                        $optText += "$i. $label`n"
                                        $i++
                                    }
                                }
                            }

                            $body = $qText
                            if ($optText) { $body += "`n" + $optText }
                            $block = Format-Callout -Type "question" -Title "Question / Quiz" -Body $body.Trim()
                            [void]$buffer.Append($block)
                        }
                    }
                }
            }
        } catch {
            # Skip invalid lines
        }
    }

    if ($buffer.Length -gt 0) {
        [System.IO.File]::AppendAllText($VaultNotePath, $buffer.ToString(), [System.Text.Encoding]::UTF8)
        Write-Host "[$(Get-Date -Format 'HH:mm:ss')] Synced new content to $VaultNotePath" -ForegroundColor Green
    }
}

# Initial Backfill
Process-NewLines ([ref]$processedLines)

if ($Watch -eq "true" -or $Watch -eq "1" -or $Watch -eq $true) {
    Write-Host "Watching for updates... (Press Ctrl+C to stop)" -ForegroundColor Cyan
    while ($true) {
        Start-Sleep -Seconds 2
        Process-NewLines ([ref]$processedLines)
    }
}

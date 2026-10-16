<#
.SYNOPSIS
    Find-RelatedNotes.ps1 - Semantic & Conceptual note discovery for the Antigravity Tutor.
    Inspects Obsidian Lessons and Smart Connections metadata to find prior knowledge.

.PARAMETER Query
    The concept, topic, or question being learned (e.g. "Simulated Annealing", "Feedback Loops").

.PARAMETER Top
    Number of top related notes to return (default 3).

.PARAMETER Json
    If specified, outputs result as a JSON string for programmatic consumption.
#>

param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$Query,

    [Parameter(Mandatory = $false)]
    [int]$Top = 3,

    [Parameter(Mandatory = $false)]
    [switch]$Json
)

$vaultRoot = Split-Path -Parent $PSScriptRoot
$lessonsDir = Join-Path $vaultRoot "Lessons"
$smartSourcesFile = Join-Path $vaultRoot ".smart-env\smart_sources\smart_sources.ajson"

if (-not (Test-Path $lessonsDir)) {
    Write-Error "Lessons directory not found at $lessonsDir"
    return
}

# 1. Tokenize query
$stopWords = @("a", "an", "the", "and", "or", "in", "on", "at", "to", "for", "of", "with", "by", "from", "how", "what", "why", "teach", "me", "about", "works", "is", "are", "do", "does")
$queryTokens = ($Query.ToLower() -replace '[^\w\s]', ' ' -split '\s+') | Where-Object { 
    $_.Length -ge 3 -and $stopWords -notcontains $_ 
}

if ($queryTokens.Count -eq 0) {
    $queryTokens = @($Query.ToLower().Trim())
}

# 2. Collect note metadata
$lessonFiles = Get-ChildItem -Path $lessonsDir -Filter "*.md"
$notes = @()

foreach ($file in $lessonFiles) {
    if ($file.Name.StartsWith(".")) { continue }
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    
    # Extract Frontmatter
    $category = ""
    $topic = ""
    $tags = @()
    if ($content -match '(?ms)^---\r?\n(.*?)\r?\n---') {
        $fm = $matches[1]
        if ($fm -match 'category:\s*(.+)') { $category = $matches[1].Trim() }
        if ($fm -match 'topic:\s*(.+)') { $topic = $matches[1].Trim() }
        if ($fm -match 'tags:\s*\[(.*?)\]') {
            $tags = ($matches[1] -split ',') | ForEach-Object { $_.Trim().TrimStart('#') }
        }
    }

    # Extract Title (H1)
    $title = $file.BaseName
    if ($content -match '(?m)^#\s+(.+)$') {
        $title = $matches[1].Trim()
    }

    # Extract Core Principle (Callout)
    $abstract = ""
    if ($content -match '(?ms)> \[!abstract\][^\r\n]*\r?\n((?:>.*?(?:\r?\n|$))+)') {
        $rawLines = $matches[1] -split '\r?\n'
        $cleaned = ($rawLines | ForEach-Object { $_ -replace '^>\s?', '' }) -join ' '
        $abstract = $cleaned.Trim()
    }

    # Score calculation
    $score = 0
    $matchedTerms = @()

    $contentLower = $content.ToLower()
    $titleLower = $title.ToLower()
    $topicLower = $topic.ToLower()
    $abstractLower = $abstract.ToLower()
    $tagsLower = ($tags -join " ").ToLower()

    foreach ($token in $queryTokens) {
        $tokenMatched = $false

        # Exact title match (highest weight)
        if ($titleLower -match [regex]::Escape($token)) {
            $score += 15
            $tokenMatched = $true
        }

        # Topic match
        if ($topicLower -match [regex]::Escape($token)) {
            $score += 10
            $tokenMatched = $true
        }

        # Tag match
        if ($tagsLower -match [regex]::Escape($token)) {
            $score += 8
            $tokenMatched = $true
        }

        # Abstract / Core principle match
        if ($abstractLower -match [regex]::Escape($token)) {
            $score += 6
            $tokenMatched = $true
        }

        # General content occurrences
        $occurrences = ([regex]::Matches($contentLower, [regex]::Escape($token))).Count
        if ($occurrences -gt 0) {
            $score += [Math]::Min($occurrences * 1.5, 12)
            $tokenMatched = $true
        }

        if ($tokenMatched) {
            $matchedTerms += $token
        }
    }

    $notes += [PSCustomObject]@{
        Title        = $title
        FileName     = $file.Name
        RelativePath = "Lessons/$($file.Name)"
        Category     = $category
        Topic        = $topic
        Tags         = $tags
        Abstract     = $abstract
        Score        = [Math]::Round($score, 2)
        MatchedTerms = ($matchedTerms | Select-Object -Unique)
    }
}

# 3. Sort by score
$ranked = $notes | Where-Object { $_.Score -gt 0 } | Sort-Object Score -Descending | Select-Object -First $Top

if ($Json) {
    $ranked | ConvertTo-Json -Depth 4
    return
}

# 4. Display human-readable summary
Write-Host ""
Write-Host "=================================================================" -ForegroundColor Cyan
Write-Host " Semantic Vault Grounding: Related Lessons for '$Query'" -ForegroundColor Green
Write-Host "=================================================================" -ForegroundColor Cyan

if (-not $ranked -or $ranked.Count -eq 0) {
    Write-Host "No direct conceptual matches found in Lessons/ for '$Query'." -ForegroundColor Yellow
    Write-Host "You are establishing a brand-new foundational cluster!" -ForegroundColor DarkGray
    Write-Host ""
    return
}

$rankIndex = 1
foreach ($item in $ranked) {
    Write-Host "[$rankIndex] [[$($item.Title)]] (Relevance Score: $($item.Score))" -ForegroundColor Yellow
    Write-Host "    File:     $($item.RelativePath)" -ForegroundColor DarkCyan
    if ($item.Category) { Write-Host "    Category: $($item.Category) | Topic: $($item.Topic)" -ForegroundColor DarkGray }
    if ($item.Tags) { Write-Host "    Tags:     #$($item.Tags -join ' #')" -ForegroundColor DarkMagenta }
    if ($item.Abstract) {
        $shortAbstract = if ($item.Abstract.Length -gt 160) { $item.Abstract.Substring(0, 157) + "..." } else { $item.Abstract }
        Write-Host "    Bedrock:  $shortAbstract" -ForegroundColor White
    }
    Write-Host ""
    $rankIndex++
}

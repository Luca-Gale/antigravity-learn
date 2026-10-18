<#
.SYNOPSIS
    Open-ObsidianNote.ps1 - Opens one or more lesson/practice notes in Obsidian.

.DESCRIPTION
    Constructs an obsidian://open URI for the given relative or absolute file path(s) inside the vault
    and invokes Start-Process once at session initialization so Obsidian opens the Dual-Note Cockpit
    (Theory in Lessons/<topic>.md and Practice in Quizzes/<topic> - Practice.md).

.PARAMETER NotePath
    One or more vault-relative paths (e.g. "Lessons/Topic.md", "Quizzes/Topic - Practice.md") or absolute paths.
#>

param(
    [Parameter(Mandatory = $true, Position = 0, ValueFromRemainingArguments = $true)]
    [string[]]$NotePath
)

$vaultRoot = (Split-Path -Parent $PSScriptRoot)

foreach ($pathItem in $NotePath) {
    if ([System.IO.Path]::IsPathRooted($pathItem)) {
        $fullPath = [System.IO.Path]::GetFullPath($pathItem)
    } else {
        $fullPath = [System.IO.Path]::GetFullPath((Join-Path $vaultRoot $pathItem))
    }

    if (-not (Test-Path $fullPath)) {
        Write-Error "Note file does not exist yet: $fullPath"
        exit 1
    }

    $encodedPath = [System.Uri]::EscapeDataString($fullPath)
    $uri = "obsidian://open?path=$encodedPath"

    Start-Process $uri
    Write-Host "Opened in Obsidian: $fullPath" -ForegroundColor Green
    if ($NotePath.Count -gt 1) {
        Start-Sleep -Milliseconds 250
    }
}

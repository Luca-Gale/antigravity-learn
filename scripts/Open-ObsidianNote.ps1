<#
.SYNOPSIS
    Open-ObsidianNote.ps1 - Automatically opens and focuses a lesson note in Obsidian.

.DESCRIPTION
    Constructs an obsidian://open URI for the given relative or absolute file path inside the vault
    and invokes Start-Process so Obsidian immediately opens and focuses the newly created lesson note.

.PARAMETER NotePath
    Vault-relative path (e.g. "Lessons/Topic.md") or absolute path to the note.
#>

param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$NotePath
)

$vaultRoot = (Split-Path -Parent $PSScriptRoot)

if ([System.IO.Path]::IsPathRooted($NotePath)) {
    $fullPath = [System.IO.Path]::GetFullPath($NotePath)
} else {
    $fullPath = [System.IO.Path]::GetFullPath((Join-Path $vaultRoot $NotePath))
}

if (-not (Test-Path $fullPath)) {
    Write-Error "Note file does not exist yet: $fullPath"
    exit 1
}

$encodedPath = [System.Uri]::EscapeDataString($fullPath)
$uri = "obsidian://open?path=$encodedPath"

Start-Process $uri
Write-Host "Opened in Obsidian: $fullPath" -ForegroundColor Green

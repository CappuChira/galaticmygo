param(
    [string]$ModRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..')).Path
)

$ErrorActionPreference = 'Stop'

function Read-Utf8Text {
    param([string]$Path)
    return [System.IO.File]::ReadAllText($Path, [System.Text.Encoding]::UTF8)
}

$report = New-Object System.Collections.Generic.List[string]
$failed = $false

$files = Get-ChildItem -LiteralPath $ModRoot -Recurse -File | Where-Object {
    $_.Extension -in @('.txt', '.mod', '.yml') -and
    $_.FullName -notlike "*\tools\*" -and
    $_.FullName -notlike "*\import_queue\*" -and
    $_.FullName -notlike "*\import_archive\*" -and
    $_.FullName -notlike "*\import_failed\*"
}
foreach ($file in $files) {
    $text = Read-Utf8Text -Path $file.FullName
    $open = ([regex]::Matches($text, '\{')).Count
    $close = ([regex]::Matches($text, '\}')).Count
    if ($open -ne $close) {
        $failed = $true
        $report.Add("BRACE_MISMATCH $($file.FullName): $open/$close")
    }
}

$locFile = Join-Path $ModRoot 'localisation\simp_chinese\mygo_l_simp_chinese.yml'
if (Test-Path -LiteralPath $locFile) {
    $bytes = [System.IO.File]::ReadAllBytes($locFile)
    if (-not ($bytes.Length -ge 3 -and $bytes[0] -eq 239 -and $bytes[1] -eq 187 -and $bytes[2] -eq 191)) {
        $failed = $true
        $report.Add("MISSING_UTF8_BOM $locFile")
    }
}

$eventDir = Join-Path $ModRoot 'events'
$eventFiles = Get-ChildItem -LiteralPath $eventDir -Recurse -File -Filter *.txt
foreach ($eventFile in $eventFiles) {
    $bytes = [System.IO.File]::ReadAllBytes($eventFile.FullName)
    if ($bytes.Length -ge 3 -and $bytes[0] -eq 239 -and $bytes[1] -eq 187 -and $bytes[2] -eq 191) {
        $failed = $true
        $report.Add("UNEXPECTED_UTF8_BOM_EVENT_SCRIPT $($eventFile.FullName)")
    }
}

$eventIds = @{}
$eventFiles | ForEach-Object {
	# This is a verbatim vanilla override. Vanilla uses nested `id` fields that
	# the lightweight regex below cannot distinguish from top-level event IDs.
	if ($_.Name -eq 'on_action_events_1.txt') { return }
	$text = Read-Utf8Text -Path $_.FullName
    foreach ($match in [regex]::Matches($text, '(?m)^\s*id\s*=\s*([A-Za-z0-9_.-]+)')) {
        $id = $match.Groups[1].Value
        if (-not $eventIds.ContainsKey($id)) {
            $eventIds[$id] = New-Object System.Collections.Generic.List[string]
        }
        $eventIds[$id].Add($_.FullName)
    }
}
foreach ($id in $eventIds.Keys) {
    if ($eventIds[$id].Count -gt 1) {
        $failed = $true
        $report.Add("DUPLICATE_EVENT_ID $id => $($eventIds[$id] -join '; ')")
    }
}

$locKeys = @{}
Get-ChildItem -LiteralPath (Join-Path $ModRoot 'localisation') -Recurse -File -Filter *.yml | ForEach-Object {
    $text = Read-Utf8Text -Path $_.FullName
    foreach ($match in [regex]::Matches($text, '(?m)^\s*([A-Za-z0-9_.-]+):\d+\s+"')) {
        $key = $match.Groups[1].Value
        if (-not $locKeys.ContainsKey($key)) {
            $locKeys[$key] = New-Object System.Collections.Generic.List[string]
        }
        $locKeys[$key].Add($_.FullName)
    }
}
foreach ($key in $locKeys.Keys) {
    if ($locKeys[$key].Count -gt 1) {
        $failed = $true
        $report.Add("DUPLICATE_LOC_KEY $key => $($locKeys[$key] -join '; ')")
    }
}

$resolutionIds = @{}
$resolutionDir = Join-Path $ModRoot 'common\resolutions'
if (Test-Path -LiteralPath $resolutionDir) {
    Get-ChildItem -LiteralPath $resolutionDir -Recurse -File -Filter *.txt | ForEach-Object {
        $text = Read-Utf8Text -Path $_.FullName
        foreach ($match in [regex]::Matches($text, '(?m)^(resolution_[A-Za-z0-9_.-]+)\s*=\s*\{')) {
            $id = $match.Groups[1].Value
            if (-not $resolutionIds.ContainsKey($id)) {
                $resolutionIds[$id] = New-Object System.Collections.Generic.List[string]
            }
            $resolutionIds[$id].Add($_.FullName)
        }
    }
}
foreach ($id in $resolutionIds.Keys) {
    if ($resolutionIds[$id].Count -gt 1) {
        $failed = $true
        $report.Add("DUPLICATE_RESOLUTION_ID $id => $($resolutionIds[$id] -join '; ')")
    }
    if (-not $locKeys.ContainsKey($id)) {
        $failed = $true
        $report.Add("MISSING_RESOLUTION_LOC $id")
    }
}

$resolutionCategoryDir = Join-Path $ModRoot 'common\resolution_categories'
if (Test-Path -LiteralPath $resolutionCategoryDir) {
    Get-ChildItem -LiteralPath $resolutionCategoryDir -Recurse -File -Filter *.txt | ForEach-Object {
        $text = Read-Utf8Text -Path $_.FullName
        foreach ($match in [regex]::Matches($text, '(?m)^(resolution_category_[A-Za-z0-9_.-]+)\s*=\s*\{')) {
            $id = $match.Groups[1].Value
            if (-not $locKeys.ContainsKey($id)) {
                $failed = $true
                $report.Add("MISSING_RESOLUTION_CATEGORY_LOC $id")
            }
        }
        foreach ($match in [regex]::Matches($text, '"(resolution_[A-Za-z0-9_.-]+)"')) {
            $id = $match.Groups[1].Value
            if (-not $resolutionIds.ContainsKey($id)) {
                $failed = $true
                $report.Add("UNKNOWN_RESOLUTION_CATEGORY_ENTRY $id")
            }
        }
    }
}

$prescriptedFlagIds = @{}
$prescriptedFlagDir = Join-Path $ModRoot 'common\prescripted_flags'
if (Test-Path -LiteralPath $prescriptedFlagDir) {
    Get-ChildItem -LiteralPath $prescriptedFlagDir -Recurse -File -Filter *.txt | ForEach-Object {
        $text = Read-Utf8Text -Path $_.FullName
        foreach ($match in [regex]::Matches($text, '(?m)^([A-Za-z0-9_.-]+)\s*=\s*\{')) {
            $id = $match.Groups[1].Value
            if (-not $prescriptedFlagIds.ContainsKey($id)) {
                $prescriptedFlagIds[$id] = New-Object System.Collections.Generic.List[string]
            }
            $prescriptedFlagIds[$id].Add($_.FullName)
        }
    }
}
foreach ($id in $prescriptedFlagIds.Keys) {
    if ($prescriptedFlagIds[$id].Count -gt 1) {
        $failed = $true
        $report.Add("DUPLICATE_PRESCRIPTED_FLAG_ID $id => $($prescriptedFlagIds[$id] -join '; ')")
    }
}

$scriptedEffectsFile = Join-Path $ModRoot 'common\scripted_effects\00_mygo_effects.txt'
if (Test-Path -LiteralPath $scriptedEffectsFile) {
    $text = Read-Utf8Text -Path $scriptedEffectsFile
    if ([regex]::IsMatch($text, 'capital_scope\s*=\s*\{\s*set_planet_flag\s*=')) {
        $failed = $true
        $report.Add("UNSAFE_CAPITAL_COLONY_PLANET_SCOPE $scriptedEffectsFile")
    }
}

$mygoResolutionsFile = Join-Path $ModRoot 'common\resolutions\00_mygo_resolutions.txt'
if (Test-Path -LiteralPath $mygoResolutionsFile) {
    $text = Read-Utf8Text -Path $mygoResolutionsFile
    if ([regex]::IsMatch($text, 'every_owned_planet\s*=\s*\{\s*limit\s*=\s*\{[^}]*has_planet_flag\s*=', [System.Text.RegularExpressions.RegexOptions]::Singleline)) {
        $failed = $true
        $report.Add("UNSAFE_OWNED_COLONY_PLANET_FLAG_SCOPE $mygoResolutionsFile")
    }
}

if ($report.Count -eq 0) {
    Write-Output "validate ok"
} else {
    $report | ForEach-Object { Write-Output $_ }
}

if ($failed) {
    exit 1
}

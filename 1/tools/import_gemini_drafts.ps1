param(
    [string]$ModRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..')).Path,
    [string]$SourceDir = '',
    [string[]]$SourcePath = @(),
    [switch]$Apply,
    [switch]$ArchiveOnSuccess
)

$ErrorActionPreference = 'Stop'

function Read-Utf8Text {
    param([string]$Path)
    return [System.IO.File]::ReadAllText($Path, [System.Text.Encoding]::UTF8)
}

function Append-Utf8BomText {
    param(
        [string]$Path,
        [string]$Text
    )
    $encoding = New-Object System.Text.UTF8Encoding($true)
    [System.IO.File]::AppendAllText($Path, $Text, $encoding)
}

function Write-Utf8BomText {
    param(
        [string]$Path,
        [string]$Text
    )
    $encoding = New-Object System.Text.UTF8Encoding($true)
    [System.IO.File]::WriteAllText($Path, $Text, $encoding)
}

function Get-BalancedBlocks {
    param(
        [string]$Text,
        [string[]]$BlockTypes
    )

    $blocks = New-Object System.Collections.Generic.List[object]
    foreach ($type in $BlockTypes) {
        $pattern = "(?m)^\s*$([regex]::Escape($type))\s*=\s*\{"
        foreach ($match in [regex]::Matches($Text, $pattern)) {
            $prefix = $Text.Substring(0, $match.Index)
            $prefixDepth = ([regex]::Matches($prefix, '\{')).Count - ([regex]::Matches($prefix, '\}')).Count
            if ($prefixDepth -ne 0) { continue }

            $start = $match.Index
            $braceStart = $Text.IndexOf('{', $match.Index)
            $depth = 0
            $end = -1
            for ($i = $braceStart; $i -lt $Text.Length; $i++) {
                if ($Text[$i] -eq '{') { $depth++ }
                elseif ($Text[$i] -eq '}') {
                    $depth--
                    if ($depth -eq 0) {
                        $end = $i
                        break
                    }
                }
            }
            if ($end -lt 0) {
                throw "Unbalanced $type block starting at character $start"
            }
            $blocks.Add([pscustomobject]@{
                Type = $type
                Text = $Text.Substring($start, $end - $start + 1).Trim()
            })
        }
    }
    return $blocks
}

function Get-EventIdsFromText {
    param([string]$Text)
    $ids = New-Object System.Collections.Generic.List[string]
    $blocks = @(Get-BalancedBlocks -Text $Text -BlockTypes @('country_event', 'fleet_event', 'situation_event'))
    foreach ($block in $blocks) {
        $match = [regex]::Match($block.Text, '(?m)^\s*id\s*=\s*([A-Za-z0-9_.-]+)')
        if ($match.Success) { $ids.Add($match.Groups[1].Value) }
    }
    return @($ids.ToArray())
}

function Get-LocEntries {
    param([string]$Text)
    $entries = New-Object System.Collections.Generic.List[string]
    foreach ($line in ($Text -split "`r?`n")) {
        if ($line -match '^\s*l_[A-Za-z_]+:\s*$') { continue }
        if ($line -match '^\s*[A-Za-z0-9_.-]+:\d+\s+".*"\s*$') {
            $entries.Add($line.TrimEnd())
        }
        elseif ($line -match '^\s*([A-Za-z0-9_.-]+):\s*"(.*)"\s*$') {
            $entries.Add(" $($matches[1]):0 ""$($matches[2])""")
        }
    }
    return $entries
}

function Get-LocKeysFromLines {
    param([string[]]$Lines)
    $keys = New-Object System.Collections.Generic.List[string]
    foreach ($line in $Lines) {
        if ($line -match '^\s*([A-Za-z0-9_.-]+):\d+\s+"') {
            $keys.Add($matches[1])
        }
    }
    return @($keys.ToArray())
}

function Get-ExistingScriptedEffects {
    param([string]$Root)
    $effects = @{}
    $dir = Join-Path $Root 'common\scripted_effects'
    if (Test-Path -LiteralPath $dir) {
        Get-ChildItem -LiteralPath $dir -Recurse -File -Filter *.txt | ForEach-Object {
            $text = Read-Utf8Text -Path $_.FullName
            foreach ($match in [regex]::Matches($text, '(?m)^\s*([A-Za-z0-9_]+_effect)\s*=\s*\{')) {
                $effects[$match.Groups[1].Value] = $true
            }
        }
    }
    return $effects
}

function Get-CalledScriptedEffects {
    param([string]$Text)
    $calls = New-Object System.Collections.Generic.List[string]
    foreach ($match in [regex]::Matches($Text, '(?m)\b([A-Za-z0-9_]+_effect)\s*=\s*yes\b')) {
        $calls.Add($match.Groups[1].Value)
    }
    return @($calls.ToArray())
}

function Get-ReviewMetadata {
    param([string]$Text)
    $approved = $Text -match '(?mi)^\s*#\s*MYGO_REVIEW_STATUS\s*:\s*APPROVED\s*$'
    $reviewer = ''
    $match = [regex]::Match($Text, '(?mi)^\s*#\s*MYGO_REVIEWED_BY\s*:\s*(.+?)\s*$')
    if ($match.Success) { $reviewer = $match.Groups[1].Value.Trim() }
    return [pscustomobject]@{ Approved = $approved; Reviewer = $reviewer }
}

$eventTarget = Join-Path $ModRoot 'events\mygo_story_events.txt'
$locTarget = Join-Path $ModRoot 'localisation\simp_chinese\mygo_l_simp_chinese.yml'
$queueDir = if ($SourceDir) { $SourceDir } else { Join-Path $ModRoot 'import_queue' }
$archiveDir = Join-Path $ModRoot 'import_archive'
$failedDir = Join-Path $ModRoot 'import_failed'
$reportPath = Join-Path $ModRoot 'import_report.txt'

if ($ArchiveOnSuccess -and -not $Apply) {
    throw '-ArchiveOnSuccess requires -Apply.'
}

New-Item -ItemType Directory -Force -Path $queueDir, $archiveDir, $failedDir | Out-Null

$sources = New-Object System.Collections.Generic.List[string]
foreach ($path in $SourcePath) {
    $sources.Add((Resolve-Path -LiteralPath $path).Path)
}
if ($sources.Count -eq 0) {
    Get-ChildItem -LiteralPath $queueDir -File | Where-Object { $_.Extension -in @('.txt', '.yml', '.yaml') } | ForEach-Object {
        $sources.Add($_.FullName)
    }
}

$report = New-Object System.Collections.Generic.List[string]
if ($sources.Count -eq 0) {
    $report.Add("NO_SOURCES $queueDir")
    $report | Set-Content -LiteralPath $reportPath -Encoding UTF8
    $report | ForEach-Object { Write-Output $_ }
    exit 0
}

$existingEventText = if (Test-Path -LiteralPath $eventTarget) { Read-Utf8Text -Path $eventTarget } else { '' }
$existingLocText = if (Test-Path -LiteralPath $locTarget) { Read-Utf8Text -Path $locTarget } else { "l_simp_chinese:`r`n" }
$existingEventIds = @{}
$existingLocKeys = @{}
foreach ($id in @(Get-EventIdsFromText -Text $existingEventText)) { $existingEventIds[$id] = $true }
foreach ($match in [regex]::Matches($existingLocText, '(?m)^\s*([A-Za-z0-9_.-]+):\d+\s+"')) {
    $existingLocKeys[$match.Groups[1].Value] = $true
}

$existingEffects = Get-ExistingScriptedEffects -Root $ModRoot
$batchEventIds = @{}
$batchLocKeys = @{}
$parsedSources = New-Object System.Collections.Generic.List[object]
$batchFailed = $false

foreach ($source in $sources) {
    $text = Read-Utf8Text -Path $source
    $name = Split-Path -Leaf $source
    $review = Get-ReviewMetadata -Text $text
    if (-not $review.Approved -or [string]::IsNullOrWhiteSpace($review.Reviewer)) {
        $report.Add("BLOCKED_UNREVIEWED $name (requires MYGO_REVIEW_STATUS: APPROVED and MYGO_REVIEWED_BY)")
        $batchFailed = $true
        continue
    }

    try {
        $eventBlocks = @(Get-BalancedBlocks -Text $text -BlockTypes @('country_event', 'fleet_event', 'situation_event'))
    }
    catch {
        $report.Add("ERROR $name $($_.Exception.Message)")
        $batchFailed = $true
        continue
    }
    $locEntries = @(Get-LocEntries -Text $text)
    if ($eventBlocks.Count -eq 0 -and $locEntries.Count -eq 0) {
        $report.Add("ERROR $name no supported event or localisation entries")
        $batchFailed = $true
        continue
    }

    $sourceFailed = $false
    foreach ($block in $eventBlocks) {
        $ids = @(Get-EventIdsFromText -Text $block.Text)
        if ($ids.Count -ne 1) {
            $report.Add("ERROR $name event block must contain exactly one id")
            $sourceFailed = $true
            continue
        }
        $id = $ids[0]
        if ($existingEventIds.ContainsKey($id)) {
            $report.Add("ERROR $name duplicate existing event id $id")
            $sourceFailed = $true
        }
        elseif ($batchEventIds.ContainsKey($id)) {
            $report.Add("ERROR $name duplicate batch event id $id (also in $($batchEventIds[$id]))")
            $sourceFailed = $true
        }
        else {
            $batchEventIds[$id] = $name
        }
        foreach ($call in @(Get-CalledScriptedEffects -Text $block.Text)) {
            if (-not $existingEffects.ContainsKey($call)) {
                $report.Add("ERROR $name missing scripted effect $call used by $id")
                $sourceFailed = $true
            }
        }
    }

    foreach ($key in @(Get-LocKeysFromLines -Lines $locEntries)) {
        if ($existingLocKeys.ContainsKey($key)) {
            $report.Add("ERROR $name duplicate existing localisation key $key")
            $sourceFailed = $true
        }
        elseif ($batchLocKeys.ContainsKey($key)) {
            $report.Add("ERROR $name duplicate batch localisation key $key (also in $($batchLocKeys[$key]))")
            $sourceFailed = $true
        }
        else {
            $batchLocKeys[$key] = $name
        }
    }

    if ($sourceFailed) {
        $batchFailed = $true
        Copy-Item -LiteralPath $source -Destination (Join-Path $failedDir $name) -Force
        continue
    }

    $parsedSources.Add([pscustomobject]@{
        Path = $source
        Name = $name
        Reviewer = $review.Reviewer
        EventBlocks = $eventBlocks
        LocEntries = $locEntries
    })
}

if ($batchFailed) {
    $report.Add('BATCH_ABORTED no game-loaded files changed')
    $report | Set-Content -LiteralPath $reportPath -Encoding UTF8
    $report | ForEach-Object { Write-Output $_ }
    exit 1
}

foreach ($parsed in $parsedSources) {
    $report.Add("REVIEW_OK $($parsed.Name) by $($parsed.Reviewer)")
    foreach ($block in $parsed.EventBlocks) {
        $id = @(Get-EventIdsFromText -Text $block.Text)[0]
        $report.Add("READY_EVENT $($parsed.Name) => $id")
    }
    foreach ($key in @(Get-LocKeysFromLines -Lines $parsed.LocEntries)) {
        $report.Add("READY_LOC $($parsed.Name) => $key")
    }
}

if (-not $Apply) {
    $report.Add('DRY_RUN_OK no game-loaded files changed; rerun with -Apply after reviewing this report')
    $report | Set-Content -LiteralPath $reportPath -Encoding UTF8
    $report | ForEach-Object { Write-Output $_ }
    exit 0
}

& (Join-Path $PSScriptRoot 'validate_mygo_mod.ps1') -ModRoot $ModRoot
if (-not $?) {
    $report.Add('BASELINE_INVALID validate_mygo_mod.ps1 failed; no files changed')
    $report | Set-Content -LiteralPath $reportPath -Encoding UTF8
    $report | ForEach-Object { Write-Output $_ }
    exit 1
}

$originalEventText = $existingEventText
$originalLocText = $existingLocText
try {
    foreach ($parsed in $parsedSources) {
        foreach ($block in $parsed.EventBlocks) {
            $id = @(Get-EventIdsFromText -Text $block.Text)[0]
            $payload = "`r`n`r`n# BEGIN REVIEWED IMPORT $id from $($parsed.Name)`r`n$($block.Text)`r`n# END REVIEWED IMPORT $id`r`n"
            Append-Utf8BomText -Path $eventTarget -Text $payload
            $report.Add("IMPORT_EVENT $($parsed.Name) => $id")
        }
        if ($parsed.LocEntries.Count -gt 0) {
            $payload = "`r`n# BEGIN REVIEWED IMPORT localisation from $($parsed.Name)`r`n" + (($parsed.LocEntries | ForEach-Object { $_ }) -join "`r`n") + "`r`n# END REVIEWED IMPORT localisation from $($parsed.Name)`r`n"
            Append-Utf8BomText -Path $locTarget -Text $payload
            foreach ($key in @(Get-LocKeysFromLines -Lines $parsed.LocEntries)) {
                $report.Add("IMPORT_LOC $($parsed.Name) => $key")
            }
        }
    }

    & (Join-Path $PSScriptRoot 'validate_mygo_mod.ps1') -ModRoot $ModRoot
    if (-not $?) { throw 'validate_mygo_mod.ps1 failed' }
}
catch {
    Write-Utf8BomText -Path $eventTarget -Text $originalEventText
    Write-Utf8BomText -Path $locTarget -Text $originalLocText
    $report.Add("ROLLBACK $($_.Exception.Message)")
    $report | Set-Content -LiteralPath $reportPath -Encoding UTF8
    $report | ForEach-Object { Write-Output $_ }
    exit 1
}

if ($ArchiveOnSuccess) {
    $stamp = Get-Date -Format 'yyyyMMdd_HHmmss'
    $batchArchiveDir = Join-Path $archiveDir "reviewed_import_$stamp"
    New-Item -ItemType Directory -Force -Path $batchArchiveDir | Out-Null
    foreach ($parsed in $parsedSources) {
        Move-Item -LiteralPath $parsed.Path -Destination (Join-Path $batchArchiveDir $parsed.Name) -Force
        $report.Add("ARCHIVE $($parsed.Name) => $batchArchiveDir")
    }
}

$report.Add('APPLY_OK')
$report | Set-Content -LiteralPath $reportPath -Encoding UTF8
$report | ForEach-Object { Write-Output $_ }

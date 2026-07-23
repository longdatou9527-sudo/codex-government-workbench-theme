[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$packageRoot = Split-Path -Parent $PSCommandPath
$skinRoot = Join-Path $env:LOCALAPPDATA 'CodexDreamSkin'
$engineRoot = Join-Path $skinRoot 'engine'
$themeSource = Join-Path $packageRoot 'theme'
$patchSource = Join-Path $packageRoot 'engine-patch'

if (-not (Test-Path -LiteralPath (Join-Path $engineRoot 'scripts\start-dream-skin.ps1') -PathType Leaf)) {
  throw '未检测到 Codex Dream Skin。请先在这台电脑安装 Codex Dream Skin，再运行本安装器。'
}

$stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
$backupRoot = Join-Path $skinRoot "backups\government-workbench-$stamp"
New-Item -ItemType Directory -Force -Path $backupRoot | Out-Null

foreach ($item in @('assets\renderer-inject.js', 'assets\dream-skin.css', 'scripts\injector.mjs', 'scripts\common-windows.ps1')) {
  $target = Join-Path $engineRoot $item
  if (Test-Path -LiteralPath $target -PathType Leaf) {
    $backup = Join-Path $backupRoot ($item -replace '\\', '_')
    Copy-Item -LiteralPath $target -Destination $backup -Force
  }
}

$activeTheme = Join-Path $skinRoot 'active-theme'
if (Test-Path -LiteralPath $activeTheme) {
  Copy-Item -LiteralPath $activeTheme -Destination (Join-Path $backupRoot 'active-theme') -Recurse -Force
}

Copy-Item -LiteralPath (Join-Path $patchSource 'renderer-inject.js') -Destination (Join-Path $engineRoot 'assets\renderer-inject.js') -Force
Copy-Item -LiteralPath (Join-Path $patchSource 'dream-skin.css') -Destination (Join-Path $engineRoot 'assets\dream-skin.css') -Force
Copy-Item -LiteralPath (Join-Path $patchSource 'injector.mjs') -Destination (Join-Path $engineRoot 'scripts\injector.mjs') -Force
Copy-Item -LiteralPath (Join-Path $patchSource 'common-windows.ps1') -Destination (Join-Path $engineRoot 'scripts\common-windows.ps1') -Force

New-Item -ItemType Directory -Force -Path $activeTheme | Out-Null
Get-ChildItem -LiteralPath $activeTheme -Force | Remove-Item -Force -Recurse
Copy-Item -LiteralPath (Join-Path $themeSource '*') -Destination $activeTheme -Recurse -Force

$savedTheme = Join-Path $skinRoot 'themes\codex-government-workbench'
New-Item -ItemType Directory -Force -Path $savedTheme | Out-Null
Get-ChildItem -LiteralPath $savedTheme -Force | Remove-Item -Force -Recurse
Copy-Item -LiteralPath (Join-Path $themeSource '*') -Destination $savedTheme -Recurse -Force

& (Join-Path $engineRoot 'scripts\start-dream-skin.ps1') -RestartExisting
Write-Host "政务工作台主题已导入并启用。原文件备份在：$backupRoot"

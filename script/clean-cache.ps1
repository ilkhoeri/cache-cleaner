# Cleanup Dev Caches - PowerShell Script
Write-Host "Cleaning development cache folders..." -ForegroundColor Cyan

# Load targets from JSON file
$jsonPath = Join-Path $PSScriptRoot "cache-targets.json"
if (-Not (Test-Path $jsonPath)) {
  Write-Host "❎ JSON config not found: $jsonPath" -ForegroundColor Red
  exit 1
}

$jsonContent = Get-Content $jsonPath -Raw | ConvertFrom-Json
$targets = $jsonContent.targets | ForEach-Object {
  [Environment]::ExpandEnvironmentVariables($_)
}

# $response = Read-Host "⚠️ Clean ALL dev & app caches? (y/n)"
# if ($response -ne 'y') {
#   Write-Host "❎ Aborted." -ForegroundColor Red
#   exit
# }
# "%APPDATA%\\GitHub Desktop",
# "%LOCALAPPDATA%\\GitHubDesktop",

Write-Host "`n⚠️ Clean ALL dev & app caches? (y/n)" -ForegroundColor Yellow
$choice = [System.Console]::ReadKey($true).KeyChar

if ($choice -ne 'y' -and $choice -ne 'Y') {
  Write-Host "`n❎ Aborted." -ForegroundColor Red
  exit
}

# Clean TEMP separately
Write-Host "`n🧼 Proceeding with cleanup...`n" -ForegroundColor Magenta

Get-ChildItem -Path $env:TEMP -Recurse -Force -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue


foreach ($path in $targets) {
  if (Test-Path $path) {
    Write-Host "`n🧹 Cleaning: $path" -ForegroundColor Yellow
    try {
      Get-ChildItem -Path $path -Recurse -Force -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
      Write-Host "✅ Cleared : $path" -ForegroundColor Green
    } catch {
      Write-Host "⚠️ Failed to clean $path" -ForegroundColor Red
    }
  } else {
    Write-Host "❎ Path not found: $path" -ForegroundColor DarkGray
  }
}

Write-Host "`n✅ Done! Development caches cleaned.`n" -ForegroundColor Cyan
# Pause

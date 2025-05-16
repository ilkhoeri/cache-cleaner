# Cleanup Dev Caches - PowerShell Script

Write-Host "Cleaning development cache folders..." -ForegroundColor Cyan

$targets = @(
  # Development tools
  "$env:USERPROFILE\AppData\Local\bun",
  "$env:APPDATA\npm-cache",
  "$env:LOCALAPPDATA\Yarn\Cache",
  "$env:USERPROFILE\AppData\Local\deno\deps",
  "$env:USERPROFILE\AppData\Local\deno\registry",
  "$env:APPDATA\Code\Cache",
  "$env:APPDATA\Code\CachedData",
  "$env:APPDATA\Code\User\workspaceStorage",

  # App Temp
  "$env:USERPROFILE\AppData\Local\Temp",

  # Adobe (common folders, may vary by version)
  "$env:USERPROFILE\AppData\Roaming\Adobe",
  "$env:USERPROFILE\AppData\Local\Adobe",
  "$env:PROGRAMDATA\Adobe",

  # Kingsoft (WPS Office etc.)
  "$env:USERPROFILE\AppData\Local\Kingsoft",
  "$env:USERPROFILE\AppData\Roaming\Kingsoft",

  # Microsoft Office, Edge, Teams, VS, etc.
  "$env:LOCALAPPDATA\Microsoft\Edge",
  "$env:APPDATA\Microsoft\Teams",
  "$env:LOCALAPPDATA\Microsoft\Teams",
  "$env:APPDATA\Microsoft\Office",
  "$env:LOCALAPPDATA\Microsoft\Office",
  "$env:LOCALAPPDATA\Microsoft\VisualStudio",

  # PowerToys
  "$env:LOCALAPPDATA\Microsoft\PowerToys",

  # MongoDB Compass
  "$env:APPDATA\MongoDB Compass",
  "$env:LOCALAPPDATA\MongoDB Compass",

  # Zoom
  "$env:APPDATA\Zoom",
  "$env:LOCALAPPDATA\Zoom"
)

# $response = Read-Host "⚠️ Clean ALL dev & app caches? (y/n)"
# if ($response -ne 'y') {
#   Write-Host "❎ Aborted." -ForegroundColor Red
#   exit
# }

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
      Get-ChildItem -Path $path -Recurse -Force | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
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

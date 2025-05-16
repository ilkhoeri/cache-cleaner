Write-Host "Cleaning development cache folders..." -ForegroundColor Cyan

$paths = @(
    "$env:USERPROFILE\AppData\Local\bun",
    "$env:APPDATA\npm-cache",
    "$env:LOCALAPPDATA\Yarn\Cache",
    "$env:USERPROFILE\AppData\Local\pnpm-store",
    "$env:APPDATA\Code\Cache",
    "$env:APPDATA\Code\CachedData",
    "$env:APPDATA\Code\User\workspaceStorage"
)

foreach ($path in $paths) {
    if (Test-Path $path) {
        Write-Host "Deleting: $path"
        Remove-Item -Recurse -Force -ErrorAction SilentlyContinue $path
    }
}

# Clean %TEMP%
Write-Host "Cleaning TEMP folder..."
Get-ChildItem -Path $env:TEMP -Recurse -Force -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "✔ All development cache folders cleaned!" -ForegroundColor Green
Pause

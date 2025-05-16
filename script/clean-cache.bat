@echo off
setlocal enabledelayedexpansion

echo Cleaning dev tools & app cache folders...

:: Bun
rmdir /s /q "%USERPROFILE%\AppData\Local\bun"

:: Deno
rmdir /s /q "%USERPROFILE%\.deno"

:: npm
rmdir /s /q "%APPDATA%\npm-cache"

:: yarn
rmdir /s /q "%LOCALAPPDATA%\Yarn"
rmdir /s /q "%APPDATA%\Yarn"

:: pnpm
rmdir /s /q "%USERPROFILE%\AppData\Local\pnpm-store"

:: VSCode cache
rmdir /s /q "%APPDATA%\Code\Cache"
rmdir /s /q "%APPDATA%\Code\CachedData"
rmdir /s /q "%APPDATA%\Code\User\workspaceStorage"
rmdir /s /q "%APPDATA%\Code\logs"

:: Adobe cache (Premiere, Photoshop, Illustrator, etc)
rmdir /s /q "%APPDATA%\Adobe"
rmdir /s /q "%LOCALAPPDATA%\Adobe"
rmdir /s /q "%USERPROFILE%\Documents\Adobe"

:: Kingsoft (WPS Office etc)
rmdir /s /q "%LOCALAPPDATA%\Kingsoft"

:: Microsoft cache (Office, Edge, Teams, etc)
rmdir /s /q "%LOCALAPPDATA%\Microsoft\Edge"
rmdir /s /q "%APPDATA%\Microsoft\Teams"
rmdir /s /q "%LOCALAPPDATA%\Microsoft\Office"
rmdir /s /q "%LOCALAPPDATA%\Packages\Microsoft.MicrosoftEdge_*"

:: PowerToys
rmdir /s /q "%LOCALAPPDATA%\Microsoft\PowerToys"

:: MongoDB Compass
rmdir /s /q "%APPDATA%\MongoDB Compass"

:: Zoom
rmdir /s /q "%APPDATA%\Zoom"

echo All specified cache folders have been removed.
pause

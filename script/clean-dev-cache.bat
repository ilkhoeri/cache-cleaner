@echo off
echo Cleaning development cache folders...

:: Bun
echo Deleting Bun cache...
rmdir /s /q "%USERPROFILE%\AppData\Local\bun"

:: npm
echo Deleting npm cache...
rmdir /s /q "%APPDATA%\npm-cache"

:: Yarn
echo Deleting Yarn cache...
rmdir /s /q "%LOCALAPPDATA%\Yarn\Cache"

:: pnpm (optional)
echo Deleting pnpm store (if exists)...
rmdir /s /q "%USERPROFILE%\AppData\Local\pnpm-store"

:: VSCode
echo Cleaning VSCode Cache & Workspace Storage...
rmdir /s /q "%APPDATA%\Code\Cache"
rmdir /s /q "%APPDATA%\Code\CachedData"
rmdir /s /q "%APPDATA%\Code\User\workspaceStorage"

:: Temp
echo Cleaning %TEMP% folder...
del /q /f /s "%TEMP%\*.*"
for /d %%p in ("%TEMP%\*.*") do rmdir "%%p" /s /q

echo All development caches deleted!
pause

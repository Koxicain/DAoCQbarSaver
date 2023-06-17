@echo off
set "source_folder=%UserProfile%\AppData\Roaming\Electronic Arts\Dark Age of Camelot\LotM"
set "backup_folder=%~dp0DAoC Config Backup"

:menu
echo.
echo 1. Backup files
echo 2. Restore files
echo.
set /p choice="Choose an option: "

if "%choice%"=="1" goto backup
if "%choice%"=="2" goto restore

echo Invalid choice. Please try again.
goto menu

:backup
mkdir "%backup_folder%"
for %%F in ("%source_folder%\*") do (
    xcopy /Y "%%F" "%backup_folder%"
)
goto end

:restore
for %%F in ("%backup_folder%\*") do (
    xcopy /Y "%%F" "%source_folder%"
)
goto end

:end
@echo off
setlocal enabledelayedexpansion
set "source_folder=%UserProfile%\AppData\Roaming\Electronic Arts\Dark Age of Camelot\LotM"

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
set /p filename="Enter the Character name: "
set /p specline="Enter the SpecLine: "
set "backup_folder=%~dp0%filename% - %specline%"

mkdir "%backup_folder%"

for %%N in (41,49,50,51,52,53,54,55,56) do (
    if exist "%source_folder%\%filename%-%%N.ini" (
        xcopy /Y "%source_folder%\%filename%-%%N.ini" "%backup_folder%"
    )
)
if exist "%source_folder%\%filename%-143.ign" (
    xcopy /Y "%source_folder%\%filename%-143.ign" "%backup_folder%"
)
goto end

:restore
set /p filename="Enter the Class or Character name: "
set i=0

for /D %%D in (*%filename%*) do (
    set /a i+=1
    set "folder[!i!]=%%~nxD"
    echo !i!. %%~nxD
)

set /p choice="Choose a folder to restore from by typing its number: "
set "backup_folder=%~dp0!folder[%choice%]!"

for %%N in (41,49,50,51,52,53,54,55,56) do (
    if exist "%backup_folder%\%filename%-%%N.ini" (
        xcopy /Y "%backup_folder%\%filename%-%%N.ini" "%source_folder%"
    )
)
if exist "%backup_folder%\%filename%-143.ign" (
    xcopy /Y "%backup_folder%\%filename%-143.ign" "%source_folder%"
)
goto end
:end
echo -----------------COMPLETE-----------------
timeout /t 3 >nul
endlocal
exit

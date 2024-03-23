@echo off
setlocal enabledelayedexpansion
set "source_folder=%UserProfile%\AppData\Roaming\Electronic Arts\Dark Age of Camelot\LotM"

rem **Get the directory where the script itself is located**
set "script_dir=%~dp0" 

rem **Construct the path to the main backup folder**
set "backup_main_folder=%script_dir%DAoC Specline Backup"

rem **Create the main backup folder if it doesn't exist**
if not exist "%backup_main_folder%" mkdir "%backup_main_folder%"

rem **Construct the path to the MAIN backup folder**
set "backup_main_folder2=%script_dir%DAoC Full Backup"

:menu
echo ##############################################################
echo.
echo.
echo.
echo 1. Backup All files
echo 2. Restore All files
echo 3. Backup Single Char file
echo 4. Restore Single Char file
echo 5. Exit
echo.
echo.
echo.
echo ##############################################################
echo.
set /p choice="Choose an option: "

if "%choice%"=="1" goto backupAll
if "%choice%"=="2" goto restoreAll
if "%choice%"=="3" goto backup
if "%choice%"=="4" goto restore
if "%choice%"=="5" goto end


echo Invalid choice. Please try again.
goto menu

:backup
echo ##############################################################
echo.
echo.
echo.
echo Search for the Character next step is to add the specline.
echo.
echo.
echo.
echo ##############################################################
echo.
set /p filename="Enter the Character name: "
set /p specline="Enter the SpecLine: "

rem **Create the specific backup folder using character name and specline **
set "backup_folder=%backup_main_folder%\%filename% - %specline%"
mkdir "%backup_folder%"

for %%N in (41,49,50,51,52,53,54,55,56) do (
    if exist "%source_folder%\%filename%-%%N.ini" (
        xcopy /Y "%source_folder%\%filename%-%%N.ini" "%backup_folder%"
    )
)
if exist "%source_folder%\%filename%-143.ign" (
    xcopy /Y "%source_folder%\%filename%-143.ign" "%backup_folder%"
)
echo.
echo.
echo -----------------COMPLETE-----------------
echo ##############################################################
goto menu

:restore
set /p filename="Enter the Character name: "
set i=0

rem **Search for folders in the main backup folder**
for /D %%D in ("%backup_main_folder%\*%filename%*") do (
    set /a i+=1
    set "folder[!i!]=%%~nxD"
    echo !i!. %%~nxD
)

set /p choice="Choose a folder to restore from by typing its number: "

rem **Construct the full path to the chosen backup folder** 
set "backup_folder=%backup_main_folder%\!folder[%choice%]!"

echo backup_folder: %backup_folder%
echo filename: %filename%

for %%N in (41,49,50,51,52,53,54,55,56) do (
    for %%F in ("%backup_folder%\*%%N.ini") do (
        xcopy /Y "%%F" "%source_folder%"
    )
)
for %%F in ("%backup_folder%\*143.ign") do (
    xcopy /Y "%%F" "%source_folder%"
)
echo.
echo.
echo -----------------COMPLETE-----------------
echo ##############################################################
goto menu


:backupAll
rem **Get date stamp in regional format**
for /f "tokens=1-3 delims=/ " %%a in ("%date%") do set datestamp=%%c-%%b-%%a 

rem **Find the next available backup folder number**
set backup_number=1
for /d %%D in ("%backup_main_folder2%\Backup*") do (
    set /a backup_number+=1
)

rem **Create backup folder in the main folder**
mkdir "%backup_main_folder2%\Backup%backup_number%"

for %%F in ("%source_folder%\*") do (
 xcopy /Y "%%F" "%backup_main_folder2%\Backup%backup_number%"
)

rem **Create Backup.txt**
echo %datestamp% > "%backup_main_folder2%\Backup%backup_number%\Backup.txt"

echo %date%
echo.
echo.
echo -----------------COMPLETE-----------------
echo ##############################################################
goto menu

:restoreAll
rem **List all folders**
setlocal enabledelayedexpansion
set i=0
echo.
echo.
echo.
echo ##############################################################
echo.
echo Choose a Backup to restore from. Date in YYYY/MM/DD 
echo.			
for /d %%D in ("%backup_main_folder2%\Backup*") do (
    set /a i+=1
    for /f "usebackq delims=" %%a in ("%%D\Backup.txt") do (
        set backupDate=%%a
        echo !i!. Backup - !backupDate!
    ) 
)
echo.
echo ##############################################################
echo.
set /p choice="Choose a folder to restore (enter number): "


rem **Validate choice**
if %choice% gtr %i% (
 echo Invalid choice.
 goto restore
)

rem **Perform restore (Modify the backup folder path here)**
for %%F in ("%backup_main_folder2%\Backup%choice%\*") do ( 
 xcopy /Y "%%F" "%source_folder%"
)
echo.
echo.
echo -----------------COMPLETE-----------------
echo ##############################################################
goto menu


:end
endlocal
exit

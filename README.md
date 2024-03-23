# DAoC Backup & Restore Script

This batch script provides tools for backing up and restoring configuration files for Dark Age of Camelot (DAoC).

## Features

* **Selective Character Backup:** Backs up specific character configuration files (e.g., settings-151.ini) as well as the associated .ign file. Allows for character name and specline to be included in the backup folder name.
* **Full Backup:** Backs up all files within your DAoC configuration folder. Creates numbered folders and includes a "Backup.txt" file with the creation date.
## Usage Instructions

1. **Placement:** It's recommended to place this script (daoc_backup.bat) in a separate folder. The script will create two additional folders for backups within the same directory it's located:
* DAoC Specline Backup
* DAoC Full Backup
2. **Download:** Download or copy the script content into a .bat file (e.g., daoc_backup.bat)
3. **Execute:** Run the batch file from the command line or a Windows shortcut.
4. **Menu:** Follow the on-screen menu to:
* Choose between full backup or single character backup.
* Provide a character name and specline (for single character backup).
* Select a backup folder to restore from.

## Notes

The script assumes your DAoC configuration files are located in the default path: ```%UserProfile%\AppData\Roaming\Electronic Arts\Dark Age of Camelot\LotM```

If your configuration files are in a different location, you'll need to modify the source_folder variable within the script.


## Disclaimer
This script is provided as-is. Use at your own risk. Always create backups of your critical data using multiple methods to ensure safety.

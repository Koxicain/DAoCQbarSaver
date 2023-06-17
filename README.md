# DAoCQbarSaver
This script provides a simple method to backup and restore character files for the game "Dark Age of Camelot."
Save your Qbars!
## Requirements

- Windows operating system
- Dark Age of Camelot installed at the standard location

## How To Use

1. **Place the batch file** in the directory where you want the backups to be stored. This can be anywhere on your computer.
2. **Double-click the batch file** to run it. A command prompt window will open.
3. You will see a menu with two options: `Backup files (1)` and `Restore files (2)`. Type the corresponding number for the operation you want to perform and press `Enter`.

If you chose to **backup files**:

   - You will be prompted to enter the character name and the SpecLine. Type these in exactly as they appear in the game and press `Enter` after each one.
   - The script will then create a backup of the character's .ini files and the corresponding .ign file in a new folder in the directory where the batch file is located. This folder will be named with the format `Character Name - SpecLine`.

If you chose to **restore files**:

   - You will be prompted to enter the character name. The script will then display all backup folders that contain the class or character's name.
   - Choose a folder to restore from by typing its corresponding number and press `Enter`.
   - The script will then restore all .ini files and the corresponding .ign file from the selected backup folder to the game's folder.

4. Once the chosen operation is complete, the script will display "-----------------COMPLETE-----------------", pause for 3 seconds, and then automatically close.


# DAoC Save All Config files

This script is designed to backup or restore all files from the "Dark Age of Camelot" game configuration directory, located in `AppData\Roaming\Electronic Arts\Dark Age of Camelot\LotM`. The script will create a backup folder named "DAoC Config Backup" in its own location (the location where the script itself is located).

## How to Use Full Backup

1. Run the script by double clicking the `.bat` file or running it from the command line.
2. A menu will appear with two options: 
    1. Backup files
    2. Restore files
3. Enter `1` to backup files or `2` to restore files, and then press Enter.
    - If you selected to backup files, the script will create a new folder named "DAoC Config Backup", and copy all files from the DAoC configuration directory into it.
    - If you selected to restore files, the script will copy all files from the "DAoC Config Backup" folder back to their original location.

Please note that if a file with the same name already exists in the destination folder, it will be overwritten.

This script is useful for players who want to easily backup and restore their entire DAoC configuration.

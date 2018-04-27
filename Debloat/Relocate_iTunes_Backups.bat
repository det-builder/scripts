REM This script will relocate the iTunes backup from the user profile to the D Drive.
REM
REM Note, be sure to put in the correct "<user>" value in the command below.
REM

REM Ensure the destination directory is deleted.
rmdir /q /s D:\My_Apps\iTunes_Backups\Backup

REM Delete the directory that we're moving.
del "C:\Users\<user>\AppData\Roaming\Apple Computer\MobileSync\Backup"

REM Execute the mklink command to create a link between the two directories.
mklink /j "C:\Users\<user>\AppData\Roaming\Apple Computer\MobileSync\Backup" "D:\My_Apps\iTunes_Backups\Backup"

REM At this point, need to ensure the iTunes device backups exist inside of the "D:\My_Apps\iTunes_Backups\Backup" directory.

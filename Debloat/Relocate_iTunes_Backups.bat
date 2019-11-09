REM This script will relocate the iTunes backup from the user profile to the D Drive.
REM
REM Note, be sure to put in the correct "<user>" value in the command below.
REM

REM NOTE! This directory is optional to delete.  If there are backups in this directory
REM you wish to keep then don't execute this command.
rmdir /q /s D:\My_Apps\iTunes_Backups\Backup

REM Delete the directory that we're moving.  NOTE, with the move to the MS Store, the location
REM for iTunes backup was changed.  I left the previous version in here.
rmdir /q /s "c:\users\<user>\apple\mobilesync\backup"

REM Execute the mklink command to create a link between the two directories.  NOTE, with the move to the MS Store, the location
REM for iTunes backup was changed.  I left the previous version in here.
mklink /j "C:\Users\<user>\Apple\MobileSync\Backup" "d:\My_Backups\iTunes_Backups"


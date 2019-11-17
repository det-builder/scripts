REM ******************************************************************
REM * Relocate_Spotify_Cache.bat                                     *
REM *                                                                *
REM * This script will relocate the Spotify cache folder with within *
REM * the user profile folders to a more centralized location on the *
REM * backup drive.                                                  *
REM *                                                                *
REM * Notes                                                          *
REM * Be sure this script isn't ran until the Spotify app has been   *
REM * run at least once.  Doing so will ensure the basic directories *
REM * are created and exist.                                         *
REM *                                                                *
REM * Todo's                                                         *
REM * 1) Change the environment variables below to represent the     *
REM *    current values on the machine.                              *
REM *                                                                *
REM ******************************************************************

REM Environment variables defined below.  Please change to current values.
SET src_backup_dir="C:\Users\%username%\AppData\Local\Spotify\Storage"
set tgt_backup_dir="E:\My_Spotify"

REM Delete the directory that we're moving.  NOTE, this is the updated source
REM directory used with the Spotify app moving to the Windows Store. 
if exist %src_backup_dir% rmdir /q /s %src_backup_dir%

REM NOTE! This directory is optional to delete.  If there are backups in this directory
REM you wish to keep then don't execute this command.
rmdir /q /s %tgt_backup_dir%

REM Execute the mklink command to create a link between the two directories.  
mklink /j %src_backup_dir% %tgt_backup_dir%

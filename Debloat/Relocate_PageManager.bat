REM This script will relocate the default directory for the Page Manager app from default location to d:\my_downloads.
REM
REM Note, be sure to put in the correct "<user>" value in the command below.
REM

REM Delete the directory that we're moving.
rmdir "C:\Users\<user>\Documents\My PageManager" /s /q

REM Execute the mklink command to create a link between the two directories.
mklink /j "C:\Users\<user>\Documents\My PageManager" "d:\My_Downloads"

@ECHO ON

REM **********************************************************************
REM * Sync.bat                                                           *
REM *                                                                    *
REM * This script is used to backup and sync several foldres on my       *
REM * Windows PC to my external hard drive that is kept off-site.        *
REM *                                                                    *
REM * Usage Instructions                                                 *
REM *                                                                    *
REM * Double-click the Sync.bat file in the root of the F:\ drive.       *
REM *                                                                    *
REM **********************************************************************

REM Sync folders on the D Drive
robocopy "D:\My_Apps" "F:\D_Drive\My_Apps" /mir 
robocopy "D:\My_Documents" "F:\D_Drive\My_Documents" /mir 
robocopy "D:\My_Movies" "F:\D_Drive\My_Movies" /mir 
robocopy "D:\My_Music" "F:\D_Drive\My_Music" /mir 
robocopy "D:\My_Pictures" "F:\D_Drive\My_Pictures" /mir 

REM Sync folders on the C Drive
robocopy "C:\Users\<user>\Saved Games" "F:\C_Drive\Saved Games" /mir 
robocopy "C:\Users\<user>\AppData\Roaming\Mozilla\Firefox" "F:\C_Drive\Firefox Profile" /mir 

REM  Write the current date so that we know when this drive was last synched.
ECHO Backed up at %date% %time% > f:\LastSync.txt

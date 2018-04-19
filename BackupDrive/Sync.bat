
ECHO Deleting LastSync.txt file, if it exists.
IF EXIST f:\LastSync.txt del f:\LastSync.txt

REM Sync folders on the D Drive
robocopy "D:\My_Apps" "F:\D_Drive\My_Apps" /mir 
robocopy "D:\My_Documents" "F:\D_Drive\My_Documents" /mir 
robocopy "D:\My_Movies" "F:\D_Drive\My_Movies" /mir 
robocopy "D:\My_Music" "F:\D_Drive\My_Music" /mir 
robocopy "D:\My_Pictures" "F:\D_Drive\My_Pictures" /mir 

REM Sync folders on the C Drive
robocopy "C:\Users\dtier\Saved Games" "F:\C_Drive\Saved Games" /mir 
robocopy "C:\Users\dtier\AppData\Roaming\Mozilla\Firefox" "F:\C_Drive\Firefox Profile" /mir 

REM  Write the current date so that we know when this drive was last synched.
ECHO Backed up at %date% %time% > f:\LastSync.txt



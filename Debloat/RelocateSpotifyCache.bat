REM This script will relocate the Spotify cache from the default location under my user profile on the SSD to the D drive.
REM
REM Note, be sure to put in the correct "<user>" value in the command below.
REM

REM Ensure the destination directory is deleted and re-created.
rmdir /q /s d:\My_Spotify
mkdir d:\My_Spotify

REM Delete the directory that we're moving.
rmdir "C:\Users\<user>\AppData\Local\Packages\SpotifyAB.SpotifyMusic_zpdnekdrzrea0\LocalCache\Spotify\data" /s /q

REM Execute the mklink command to create a link between the two directories.
mklink /j "C:\Users\<user>\AppData\Local\Packages\SpotifyAB.SpotifyMusic_zpdnekdrzrea0\LocalCache\Spotify\data" "d:\My_Spotify"

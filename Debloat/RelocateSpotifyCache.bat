REM This script will relocate the Spotify cache from the default location under my user profile on the SSD to the D drive.
REM
REM Note, be sure to put in the correct "<user>" value in the command below.
REM

REM Ensure the destination directory is deleted.
rmdir /q /s d:\spotify

REM Delete the directory that we're moving.
del "C:\Users\<user>\AppData\Local\Packages\SpotifyAB.SpotifyMusic_zpdnekdrzrea0\LocalCache\Spotify\data"

REM Execute the mklink command to create a link between the two directories.
mklink /j "C:\Users\<user>\AppData\Local\Packages\SpotifyAB.SpotifyMusic_zpdnekdrzrea0\LocalCache\Spotify\data" "d:\spotify"

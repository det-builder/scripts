##################################################################
# Backup_Drive_Sync.sh                                           #
#                                                                #
# This script will sync local directories onto my backup drive.  #
#                                                                #
##################################################################

# Sync folders on the D Drive
rsync -v -a --delete "/Volumes/D_Drive/OneDrive/My_Apps" "/Volumes/BackupDrive/D_Drive"
rsync -v -a --delete "/Volumes/D_Drive/OneDrive/My_Documents" "/Volumes/BackupDrive/D_Drive"
rsync -v -a --delete "/Volumes/D_Drive/OneDrive/My_Movies" "/Volumes/BackupDrive/D_Drive"
rsync -v -a --delete "/Volumes/D_Drive/OneDrive/My_Music" "/Volumes/BackupDrive/D_Drive"
rsync -v -a --delete "/Volumes/D_Drive/OneDrive/My_Pictures" "/Volumes/BackupDrive/D_Drive"

# Sync misc folders.
rsync -a --delete "/Users/dave/Library/Application Support/Firefox/Profiles/a85kqxld.default" "/Volumes/BackupDrive/Firefox_Profile"

# Write the current date so that we know when this drive was last synched.
date +%a" "%b" "%d" "%Y > /Volumes/BackupDrive/LastSync.txt


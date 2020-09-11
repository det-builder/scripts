##################################################################
# Backup_Offsite_Drive_Sync.sh                                   #
#                                                                #
# This script will sync local directories onto my backup drive.  #
#                                                                #
##################################################################

# Sync folders on the D Drive
rsync -v -a --delete "/Volumes/D_Drive/OneDrive/My_Apps" "/Volumes/OFFSITE/D_Drive"
rsync -v -a --delete "/Volumes/D_Drive/OneDrive/My_Documents" "/Volumes/OFFSITE/D_Drive"
rsync -v -a --delete "/Volumes/D_Drive/OneDrive/My_Movies" "/Volumes/OFFSITE/D_Drive"
rsync -v -a --delete "/Volumes/D_Drive/OneDrive/My_Music" "/Volumes/OFFSITE/D_Drive"
rsync -v -a --delete "/Volumes/D_Drive/OneDrive/My_Pictures" "/Volumes/OFFSITE/D_Drive"

# Sync misc folders.
# rsync -a --delete "/Users/xxxxx/Library/Application Support/Firefox/Profiles/a85kqxld.default" "/Volumes/OFFSITE/Firefox_Profile"

# Write the current date so that we know when this drive was last synched.
date +%a" "%b" "%d" "%Y > /Volumes/OFFSITE/LastSync.txt


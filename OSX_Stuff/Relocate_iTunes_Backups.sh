##################################################################
# Relocate_iTunes_Backups.bat                                    #
#                                                                #
# This script will relocate the iTunes backup folder with within #
# the user profile folders to a more centralized location on the #
# backup drive.                                                  #
#                                                                #
# Todo's                                                         #
# 1) Change the environment variables below to represent the     #
#    current values on the machine.                              #
#                                                                #
##################################################################

# Environment variables defined below.  Please change to current values.
src_backup_dir="$HOME/Library/Application Support/MobileSync/Backup"
tgt_backup_dir="/Volumes/D_Drive/My_Backups/iTunes_Backups"

# Delete the directory that we're moving.  
if [ -d "$src_backup_dir" ]; then
    rmdir "$src_backup_dir"
fi

# Execute the mklink command to create a link between the two directories.  
ln -s "$tgt_backup_dir" "$src_backup_dir"


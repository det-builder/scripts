#######################################################################################
# Sync.sh                                                                             #
#                                                                                     #
# This script is used to backup and sync several folders on my Mac to my external     #
# hard drive that is kept off-site.                                                   #
#                                                                                     #
# Usage Instructions                                                                  #
#                                                                                     #
# 1) Open Terminal and run the command "sudo su - root".  The pwd is my g password.   #
# 2) Run the command "cd /Volumes/BackupDrive"                                        #
# 3) Run the command "sh Sync.sh"                                                     #
#                                                                                     #
#######################################################################################

# Sync folders on the D Drive
rsync -a --delete /Volumes/D\ Drive/My_Apps /Volumes/BackupDrive/D_Drive  
rsync -a --delete /Volumes/D\ Drive/My_Documents /Volumes/BackupDrive/D_Drive  
rsync -a --delete /Volumes/D\ Drive/My_Downloads /Volumes/BackupDrive/D_Drive   
rsync -a --delete /Volumes/D\ Drive/My_Movies /Volumes/BackupDrive/D_Drive  
rsync -a --delete /Volumes/D\ Drive/My_Music /Volumes/BackupDrive/D_Drive 
rsync -a --delete /Volumes/D\ Drive/My_Pictures /Volumes/BackupDrive/D_Drive 
rsync -a --delete /Volumes/D\ Drive/My_VMs /Volumes/BackupDrive/D_Drive 

# Sync folders on the C Drive
rsync -a --delete /Users /Volumes/BackupDrive/C_Drive

# Write the current date so that we know when this drive was last synched.
date +%a" "%b" "%d" "%Y > /Volumes/BackupDrive/LastSync.txt

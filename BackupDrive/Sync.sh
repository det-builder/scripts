# Steps to run this script:
# 1) Open Terminal and run the command "sudo su - root" - pwd is the g password
# 2) Run the command "cd /Volumes/BackupDrive"
# 3) Run the command "./Sync.sh"

echo Backing up D Drive

# Sync folders on the D Drive
rsync -a --delete /Volumes/D\ Drive/My_Apps /Volumes/BackupDrive/D_Drive  
rsync -a --delete /Volumes/D\ Drive/My_Documents /Volumes/BackupDrive/D_Drive  
rsync -a --delete /Volumes/D\ Drive/My_Downloads /Volumes/BackupDrive/D_Drive   
rsync -a --delete /Volumes/D\ Drive/My_Movies /Volumes/BackupDrive/D_Drive  
rsync -a --delete /Volumes/D\ Drive/My_Music /Volumes/BackupDrive/D_Drive 
rsync -a --delete /Volumes/D\ Drive/My_Pictures /Volumes/BackupDrive/D_Drive 
rsync -a --delete /Volumes/D\ Drive/My_VMs /Volumes/BackupDrive/D_Drive 

echo Backing up C Drive

# Sync folders on the C Drive
rsync -a --delete /Users /Volumes/BackupDrive/C_Drive

# Write the current date so that we know when this drive was last synched.
date +%a" "%b" "%d" "%Y > /Volumes/BackupDrive/LastSync.txt

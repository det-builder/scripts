#!/usr/bin/env bash

# =======================================================================================================
#
# macos_setup_script.sh
#
# This script can be used to setup a new MAC install to my "favorite" settings.
# 
# =======================================================================================================

# Get admin access before continuing.
sudo -v

# Ensure system preferences is closed to prevent any possible issues.
osascript -e 'tell application "System Preferences" to quit'

# Disable bouncy icons in dock.
defaults write com.apple.dock no-bouncing -bool TRUE

# Disables the awful beeping that happens from time to time.
defaults write NSGlobalDomain com.apple.sound.beep.feedback -bool false
defaults write NSGlobalDomain com.apple.sound.beep.flash -bool false
defaults write NSGlobalDomain com.apple.sound.beep.volume -float 0

# Always show the scroll bars.
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# Disables the default "Natural" mouse/trackpad scrolling and makes it
# similiar to a Windows machine.
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Expands the save-as and print dialog boxes to show directories.
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# "Finder.app" tweaks.
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.finder WarnOnEmptyTrash -bool false # Disables warning when emptying trash

# Terminal commands to browse through the Time Machine backups, and, *should* show the
# files most recently backed up.
cd "/Volumes/Time Machine Backups/Backups.backupdb/DAVE1/Latest/Macintosh HD - Data"
cd "/Volumes/Time Machine/Backups.backupdb/DAVE1/Latest/D_Drive"

# This file contains listings of files automatically excluded from time machine backups.
/System/Library/CoreServices/backupd.bundle/Contents/Resources/StdExclusions.plist
find . -links 1


# All done, refresh dock and exit.
killall Dock


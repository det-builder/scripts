#!/bin/bash
if [ -n "$2" ]; then
desktop=$2
else
desktop=0; #The Desktop that we are trying to change, 0 indexed with 0 being the first desktop created
fi
if [ -n "$1" ]; then
desktopLocation="$1"
else
desktopLocation="/Library/Desktop Pictures/Snow.jpg" #Where our Desktop is located
fi
sqlite3 ~/Library/Application\ Support/Dock/desktoppicture.db 
    "update data set value='$desktopLocation' where value like '%.%' LIMIT $desktop,1;"

killall Dock

https://stackoverflow.com/questions/31430832/how-to-change-a-specific-mac-desktop-background

https://www.tech-otaku.com/mac/setting-desktop-image-macos-mojave-from-command-line/

https://github.com/heygambo/dotfiles/blob/4fa2eb7f2eb60053d7d5ce91c6fedeaeb57d89ad/scripts/set-macos-defaults.sh

https://github.com/ideasonpurpose/ansible-playbooks/blob/692b76d61034b734b6b2210ca6988e579bb102bb/roles/dock/tasks/wallpaper.yml



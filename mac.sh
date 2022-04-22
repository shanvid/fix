#!/bin/sh

## Get the logged in user
loggedInUser=$(stat -f%Su /dev/console)

## Get the Mac's UUID string
UUID=$(ioreg -rd1 -c IOPlatformExpertDevice | awk -F'"' '/IOPlatformUUID/{print $4}')

## Delete the plist array
/usr/libexec/PlistBuddy -c 'Delete :TALAppsToRelaunchAtLogin' /Users/${loggedInUser}/Library/Preferences/ByHost/com.apple.loginwindow.${UUID}.plist

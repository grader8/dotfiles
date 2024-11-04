### Require System Integrity Protection turned off 


Disable Notification Center ([source](http://osxdaily.com/2012/08/06/disable-notification-center-remove-menu-bar-icon-os-x/))

```sh
# disable
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null
## returns error without `2> /dev/null` appended at end

# enable
launchctl load -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist
```

 


## Everything Else 
```sh
# Remove/Restore Desktop Icons
defaults write com.apple.finder CreateDesktop false; killall Finder

# Restore Desktop Icons
defaults write com.apple.finder CreateDesktop true; killall Finder

# Delete or move preinstalled Apps 

# Disable automatic termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# add here...
```
([source](http://www.tweaking4all.com/os-tips-and-tricks/macosx-tips-and-tricks/macos-x-how-to-remove-pre-installed-applications/))



#### Delete Preinstalled apps

[How to turn off System Integrity Protection](https://www.imore.com/el-capitan-system-integrity-protection-helps-keep-malware-away)

#### Scrolling, Mouse, Keyboard, etc
```sh
# disable overscrolling 
defaults write -g NSScrollViewRubberbanding -bool false

# Always show scrollbars
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
# Possible values: `WhenScrolling`, `Automatic` and `Always`
```
[Turn off Overscrolling](https://www.cnet.com/how-to/disable-elastic-scrolling-in-os-x/)
[Another reference for overscrolling](https://apple.stackexchange.com/questions/253111/how-to-disable-scroll-acceleration-in-macos-sierra)

```
# Disable “natural” (Lion-style) scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
```

#### Dock

```sh
# Display dock only after cursor hovers for full 5 seconds
defaults write com.apple.Dock autohide-delay -float 5 && killall Dock
# Requires "Automatically hide and show the Dock" to be enabled
defaults write com.apple.dock autohide -bool true
# restore defaults
defaults delete com.apple.Dock autohide-delay 

# Turn off all dock bouncing
defaults write com.apple.dock no-bouncing -bool TRUE; killall Dock

# Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

# Enable the 2D Dock
defaults write com.apple.dock no-glass -bool true

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false
```

#### System Dialogs & UX/UI

```sh
# Set sidebar icon size to small (GR Note: What sidebar?)
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1

# Disable the “reopen windows when logging back in” option
# This works, although the checkbox will still appear to be checked.
defaults write com.apple.loginwindow TALLogoutSavesState -bool false
defaults write com.apple.loginwindow LoginwindowLaunchesRelaunchApps -bool false

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Disable the "Are you sure you want to open this application?" dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable reopen on restart
defaults write NSGlobalDomain ApplePersistence -bool false

# Disable the dashboard 
defaults write com.apple.dashboard mcx-disabled -bool true
```

#### File System

```sh
# Make Forklift the primary file viewer
defaults write -g NSFileViewer -string com.binarynights.ForkLift-3
# restore defaults
# defaults delete -g NSFileViewer

# Show the `~/Library` folder
chflags nohidden ~/Library

# Show Path bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

# Show Status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

# Disable warning dialog when changing file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Disable relative dates
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:ExtendedListViewSettings:useRelativeDates 0" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:ListViewSettings:useRelativeDates grid" ~/Library/Preferences/com.apple.finder.plist

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Add quit option to finder
defaults write com.apple.finder QuitMenuItem -bool TRUE

# Save to disk, not iCloud, by default
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool false
```

#### Menu Bar
```sh
# Setup the menu bar date format
defaults write com.apple.menuextra.clock DateFormat -string "EEE MMM d  h:mm a"

# Show battery percentage
defaults write com.apple.menuextra.battery ShowPercent -bool true

# enable Menu bar transparency
defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false
```

#### Screen 
```sh
# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop/Screenshots"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Enable subpixel font rendering on non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -int 2
```

#### Auto-correct
```sh
# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
```

#### Chrome
```sh
# Disable the all too sensitive backswipe on trackpads
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false

# Disable the all too sensitive backswipe on Magic Mouse
defaults write com.google.Chrome AppleEnableMouseSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome.canary AppleEnableMouseSwipeNavigateWithScrolls -bool false

# Use the system-native print preview dialog
defaults write com.google.Chrome DisablePrintPreview -bool true
defaults write com.google.Chrome.canary DisablePrintPreview -bool true

# Expand the print dialog by default
defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true
defaults write com.google.Chrome.canary PMPrintingExpandedStateForPrint2 -bool true
```

#### Other

Clean up context menu

 * Disable pushbullet and other extensions from their options menus
 * Disable unwanted options in System Preferences --> Keyboard --> Shortcuts --> Services



#### References

Some of this  was referenced from [here](https://gist.github.com/pala/2266811)
https://github.com/orrsella/dotfiles/blob/master/setup-macos.sh
https://github.com/mathiasbynens/dotfiles/blob/master/.macos



https://dotfiles.github.io/

Nice [tutorial](https://pawelgrzybek.com/change-macos-user-preferences-via-command-line/) on changing defaults


#!/usr/bin/env zsh

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# ---------------------------------------------------------- #
# programs                                                   #
# ---------------------------------------------------------- #

# install xcode-command-line-tools
xcode-select --install

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install cask

# coding
brew install git
brew install visual-studio-code
brew install python@3.10

# main applications
brew install firefox
brew install ticktick
brew install spotify
brew install 1password
brew install clipy
brew install signal
brew install stremio
brew install iina

# microsoft office
brew install onedrive
brew install microsoft-word
brew install microsoft-excel
brew install microsoft-powerpoint

# apps from the mac app store
brew install mas
mas install 441258766 # magnet

# command line tools
brew install bat
brew install zoxide
brew install exa
brew install fzf
brew install starship
brew install trash

# ---------------------------------------------------------- #
# customization & settings                                   #
# ---------------------------------------------------------- #

# zsh config
cp settings-files/.zshrc ~/.zshrc
exec zsh

# git config
git config --global user.name Augustindou
git config --global user.email augustin.doultremontao@gmail.com

# vscode config
cp settings-files/settings.json ~/Library/Application\ Support/Code/User/settings.json
cp settings-files/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json

# ---------------------------------------------------------- #
# system preferences                                         #
#     adapted from https://wilsonmar.github.io/dotfiles      #
# ---------------------------------------------------------- #

# desktop background
BACKGROUND="https://static1.squarespace.com/static/5f5ea520eae4ba6857493626/t/617b79ba29e95f07de9c584b/1635482058266/Lone+Cypress+Sunset+%28alt%29+5K.jpg"
curl $BACKGROUND --output ~/Pictures/wallpaper.jpg
osascript -e 'tell application "Finder" to set desktop picture to "/Users/augustindou/Pictures/wallpaper.jpg" as POSIX file'

# no hot corners
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tr-corner -int 0
defaults write com.apple.dock wvous-bl-corner -int 0
defaults write com.apple.dock wvous-br-corner -int 0

# hide spotlight in menu bar
defaults -currentHost write com.apple.Spotlight MenuItemHidden -int 1

# spotlight result order
defaults write com.apple.spotlight orderedItems -array \
   '{"enabled" = 1;"name" = "APPLICATIONS";}' \
   '{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
   '{"enabled" = 1;"name" = "DIRECTORIES";}' \
   '{"enabled" = 1;"name" = "PDF";}' \
   '{"enabled" = 1;"name" = "DOCUMENTS";}' \
   '{"enabled" = 1;"name" = "SPREADSHEETS";}' \
   '{"enabled" = 1;"name" = "CONTACT";}' \
   '{"enabled" = 1;"name" = "IMAGES";}' \
   '{"enabled" = 1;"name" = "MOVIES";}' \
   '{"enabled" = 0;"name" = "FONTS";}' \
   '{"enabled" = 0;"name" = "MESSAGES";}' \
   '{"enabled" = 0;"name" = "EVENT_TODO";}' \
   '{"enabled" = 0;"name" = "BOOKMARKS";}' \
   '{"enabled" = 0;"name" = "MUSIC";}' \
   '{"enabled" = 0;"name" = "PRESENTATIONS";}' \
   '{"enabled" = 0;"name" = "SOURCE";}' \
   '{"enabled" = 0;"name" = "MENU_DEFINITION";}' \
   '{"enabled" = 0;"name" = "MENU_OTHER";}' \
   '{"enabled" = 0;"name" = "MENU_CONVERSION";}' \
   '{"enabled" = 0;"name" = "MENU_EXPRESSION";}' \
   '{"enabled" = 0;"name" = "MENU_WEBSEARCH";}' \
   '{"enabled" = 0;"name" = "MENU_SPOTLIGHT_SUGGESTIONS";}'

# Load new settings before rebuilding the index
killall mds > /dev/null 2>&1

# Make sure indexing is enabled for the main volume
sudo mdutil -i on / > /dev/null

# Rebuild the index from scratch
sudo mdutil -E / > /dev/null

# disable startup sound
sudo nvram StartupMute=%01

# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Stop iTunes from responding to the keyboard media keys
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null

# Disable Speech Recognition
sudo defaults write "com.apple.speech.recognition.AppleSpeechRecognition.prefs" StartSpeakableItems -bool false

# Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Set a faster keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# custom keyboard shortcuts
# @ for cmd, ^ for ctrl, ~ for option, $ for shift
defaults write com.apple.Safari NSUserKeyEquivalents -dict-add "Close Tab" "@w"

# tracking speed (max 5)
defaults write -g com.apple.trackpad.scaling 4.0

# enable tap to click on trackpad
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# set language and text formats
defaults write NSGlobalDomain AppleLanguages -array "en" "fr"
defaults write NSGlobalDomain AppleLocale -string "en_US@currency=EUR"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true

# disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# tracking speed (max 5)
defaults write -g com.apple.mouse.scaling 3.0

# ask for password after 5 minutes of sleep
defaults write com.apple.screensaver askForPassword -bool true
defaults write com.apple.screensaver askForPasswordDelay -int 300

# save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# enable subpixel font rendering on non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -int 2

# prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# remove the sleep image file to save disk space
sudo rm /private/var/vm/sleepimage
# create a zero-byte file instead…
sudo touch /private/var/vm/sleepimage
# …and make sure it can’t be rewritten
sudo chflags uchg /private/var/vm/sleepimage

# disable the sudden motion sensor as it’s not useful for SSDs
sudo pmset -a sms 0

# disable local time machine backups
hash tmutil &> /dev/null && sudo tmutil disablelocal

# ---------------------------------------------------------- #
# finder                                                     #
#     adapted from https://wilsonmar.github.io/dotfiles      #
# ---------------------------------------------------------- #

# before editing:
killall Finder /System/Library/CoreServices/Finder.app

# show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# show path bar
defaults write com.apple.finder ShowPathbar -bool true

# show the ~/Library folder
chflags nohidden ~/Library

# show the /Volumes folder (requires password)
sudo chflags nohidden /Volumes

# set Desktop as the default location for new Finder windows
# for other paths, use `PfLo` and `file:///full/path/here/`
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"

# screenshots in png format
defaults write com.apple.screencapture type -string "png"

# show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# expand save panels by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# keep folders on top
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# use list view in all Finder windows by default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# enable AirDrop over Ethernet and on unsupported Macs running Lion
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# Expand the following File Info panes:
# "General", "Open with", and "Sharing & Permissions"
defaults write com.apple.finder FXInfoPanesExpanded -dict \
   General -bool true \
   OpenWith -bool true \
   Privileges -bool true

# ---------------------------------------------------------- #
# dock, launchpad, ...                                       #
#     adapted from https://wilsonmar.github.io/dotfiles      #
# ---------------------------------------------------------- #

# dock
brew install --cask hpedrorodrigues/tools/dockutil
defaults write com.apple.dock tilesize -int 60
defaults write com.apple.dock show-recents -bool false
dockutil --remove all
dockutil --add /Applications/Firefox.app
dockutil --add /Applications/Visual\ Studio\ Code.app
dockutil --add /System/Applications/Utilities/Terminal.app
dockutil --add /Applications/TickTick.app
dockutil --add /Applications/Spotify.app

# enable spring loading for all Dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# ---------------------------------------------------------- #
# safari                                                     #
#     adapted from https://wilsonmar.github.io/dotfiles      #
# ---------------------------------------------------------- #

# privacy: don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Press Tab to highlight each item on a web page
defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true

# prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# allow hitting the Backspace key to go to the previous page in history
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

# hide Safari’s bookmarks bar by default
defaults write com.apple.Safari ShowFavoritesBar -bool false

# hide Safari’s sidebar in Top Sites
defaults write com.apple.Safari ShowSidebarInTopSites -bool false

# make Safari’s search banners default to Contains instead of Starts With
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# remove useless icons from Safari’s bookmarks bar
defaults write com.apple.Safari ProxiesInBookmarksBar "()"

# enable continuous spellchecking
defaults write com.apple.Safari WebContinuousSpellCheckingEnabled -bool true
# disable auto-correct
defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false

# disable AutoFill
defaults write com.apple.Safari AutoFillFromAddressBook -bool false
defaults write com.apple.Safari AutoFillPasswords -bool false
defaults write com.apple.Safari AutoFillCreditCardData -bool false
defaults write com.apple.Safari AutoFillMiscellaneousForms -bool false

# warn about fraudulent websites
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true

# block pop-up windows
defaults write com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false

# enable "Do Not Track"
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# update extensions automatically
defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true

# ---------------------------------------------------------- #
# other apps                                                 #
#     adapted from https://wilsonmar.github.io/dotfiles      #
# ---------------------------------------------------------- #

# use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0

# open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

# disable smart quotes as it’s annoying for messages that contain code
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false

# ---------------------------------------------------------- #
# Conclusion                                                 #
# ---------------------------------------------------------- #

echo "Done. Please restart for all changes to take effect."
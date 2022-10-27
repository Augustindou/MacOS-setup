#!/usr/bin/env zsh

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# ---------------------------------------------------------- #
# programs                                                   #
# ---------------------------------------------------------- #

# add cask
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
brew install --cask onedrive
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
brew install --cask hpedrorodrigues/tools/dockutil

# download other programs to desktop when not available via homebrew / mac app store
logitech_options="https://download01.logi.com/web/ftp/pub/techsupport/optionsplus/logioptionsplus_installer.zip"
curl $logitech_options --output ~/Desktop/logitech_options.zip
#!/bin/bash

# ------------------------------------------------------------
# programs
# ------------------------------------------------------------

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

# ------------------------------------------------------------
# customization & settings
# ------------------------------------------------------------

# zsh config
cp settings-files/.zshrc ~/.zshrc
exec zsh

# git config
git config --global user.name Augustindou
$ git config --global user.email augustin.doultremontao@gmail.com

# dock customization
brew install --cask hpedrorodrigues/tools/dockutil
dockutil --remove all
dockutil --add /Applications/Firefox.app
dockutil --add /Applications/Visual\ Studio\ Code.app
dockutil --add /System/Applications/Utilities/Terminal.app
dockutil --add /Applications/TickTick.app
dockutil --add /Applications/Spotify.app

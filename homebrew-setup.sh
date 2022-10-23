#!/bin/bash

# install cask
brew install cask

# coding
brew install git
brew install visual-studio-code
brew install python@3.10

# applications
brew install firefox
brew install ticktick
brew install spotify
brew install microsoft-office
brew install 1password
brew install clipy
brew install signal
brew install stremio
brew install iina

# command line tools
brew install bat
brew install zoxide
brew install exa
brew install fzf
brew install starship
brew install trash

# dock customization
brew install --cask hpedrorodrigues/tools/dockutil
dockutil --remove all
dockutil --add /Applications/Firefox.app
dockutil --add /Applications/Visual\ Studio\ Code.app
dockutil --add /System/Applications/Utilities/Terminal.app
dockutil --add /Applications/TickTick.app
dockutil --add /Applications/Spotify.app
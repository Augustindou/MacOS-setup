#!/bin/bash

# install xcode-command-line-tools
xcode-select --install

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
./homebrew-setup.sh

# zsh config
cp .zshrc ~/.zshrc
exec zsh
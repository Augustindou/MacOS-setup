#!/bin/bash

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
./homebrew-setup.sh

# install xcode-command-line-tools
xcode-select --install

# zsh config
cp .zshrc ~/.zshrc
exec zsh
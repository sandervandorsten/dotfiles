#!/bin/bash

# Enable errexit option
set -e

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add brew to PATH
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile 
eval "$(/opt/homebrew/bin/brew shellenv)"

# install rosetta
sudo softwareupdate --install-rosetta

# Install everything using brew
brew bundle --global




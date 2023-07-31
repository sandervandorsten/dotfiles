#!/bin/bash

# Enable errexit option
set -e

# Check if default terminal is ZSH
if [ "$(basename "$SHELL")" = "zsh" ]; then
  echo "Default terminal is Zsh."
else
  echo "Default terminal is not zsh, exiting."
  exit 1
fi

# Install oh-my-zsh
zsh_rc_path="$HOME/.zshrc"

echo "installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "replacing blank .zshrc file that oh-my-zsh created with my own"
mv $zsh_rc_path $HOME/.zshrc.blank
mv $HOME/.zshrc.pre-oh-my-zsh $zsh_rc_path

# install zgen (plugin manager)
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

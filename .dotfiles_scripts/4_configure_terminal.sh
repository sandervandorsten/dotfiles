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

# Check if Antigen plugin manager is sourced in zsh file, and add if needed
echo "Checking if antigen config is sourced using ~/.zshrc"

search_line="source /opt/homebrew/share/antigen/antigen.zsh"

if grep -qF "$search_line" "$zsh_rc_path"; then
  echo "✅ antigen config is sourced in $HOME/.zshrc."
else
  echo "❌ antigen config is not sourced in $HOME/.zshrc.", adding source to file.
  echo "$search_line" >> "$zsh_rc_path"
  echo "added '$search_line' to zshrc."
fi

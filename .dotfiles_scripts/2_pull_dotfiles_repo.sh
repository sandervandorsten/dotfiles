cd ~

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo ".cfg" >> .gitignore
git clone --bare git@github.com:sandervandorsten/dotfiles.git $HOME/.cfg

rm .gitignore

config checkout
§

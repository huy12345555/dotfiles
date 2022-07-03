#!/bin/sh

# Backup folders
cp -r $HOME/software/ $HOME/dotfiles/
cp -r $HOME/.config/flameshot/ $HOME/dotfiles/.config/

# Backup files
cp $HOME/.config/fish/config.fish $HOME/dotfiles/.config/fish/
cp $HOME/.config/htop/htoprc $HOME/dotfiles/.config/htop/

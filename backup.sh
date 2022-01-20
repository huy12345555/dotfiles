#!/bin/sh

# Backup folder
cp -R $HOME/software/ $HOME/backup/
cp -R $HOME/Pictures/ $HOME/backup/
cp -R $HOME/Documents/ $HOME/backup/
cp -R $HOME/Music/ $HOME/backup/
cp -R $HOME/Desktop/ $HOME/backup/
cp -R $HOME/.themes/ $HOME/backup/
cp -R $HOME/.icons/ $HOME/backup/

# Backup files
cp $HOME/.config/nvim/init.vim $HOME/backup/.config/nvim/
cp $HOME/.config/nvim/local_init.vim $HOME/backup/.config/nvim/
cp $HOME/.config/nvim/local_bundles.vim $HOME/backup/.config/nvim/
cp $HOME/.zshrc $HOME/backup/
cp $HOME/.zhistory $HOME/backup/


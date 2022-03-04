#!/bin/sh

# Backup folder
cp -R $HOME/software/ $HOME/backup/
cp -R $HOME/Pictures/ $HOME/backup/
cp -R $HOME/Documents/ $HOME/backup/
cp -R $HOME/Music/ $HOME/backup/
cp -R $HOME/Videos/ $HOME/backup/

# Backup files
cp $HOME/.xbindkeysrc $HOME/backup/
cp $HOME/.config/fish/config.fish $HOME/backup/.config/fish/

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
cp $HOME/.zhistory $HOME/backup/
cp $HOME/.gitconfig $HOME/backup/

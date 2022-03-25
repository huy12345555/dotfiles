#!/bin/sh

# Backup folder
cp -r $HOME/software/ $HOME/backup/
cp -r $HOME/Pictures/ $HOME/backup/
cp -r $HOME/Documents/ $HOME/backup/
cp -r $HOME/Music/ $HOME/backup/
cp -r $HOME/Videos/ $HOME/backup/

# Backup files
cp $HOME/.xbindkeysrc $HOME/backup/
cp $HOME/.config/fish/config.fish $HOME/backup/.config/fish/
cp $HOME/.config/fish/functions/bwu.fish $HOME/backup/.config/fish/functions/
cp /etc/X11/xorg.conf.d/40-libinput.conf $HOME/backup/
cp $HOME/.config/ranger/rc.conf $HOME/backup/.config/ranger/
cp $HOME/.config/ranger/commands.py $HOME/backup/.config/ranger/

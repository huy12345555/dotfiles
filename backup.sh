#!/bin/sh

# Backup folders
cp -r $HOME/scripts/ $HOME/dotfiles/
cp -r $HOME/.config/btop/ $HOME/dotfiles/.config/
cp -r $HOME/.config/featherpad/ $HOME/dotfiles/.config/
cp -r $HOME/.config/flameshot/ $HOME/dotfiles/.config/

# Backup files
cp $HOME/.xbindkeysrc $HOME/dotfiles/
cp /etc/X11/xorg.conf.d/40-libinput.conf $HOME/dotfiles/
cp $HOME/.config/ranger/rc.conf $HOME/dotfiles/.config/ranger/
cp $HOME/.config/ranger/commands.py $HOME/dotfiles/.config/ranger/
cp $HOME/.config/fish/config.fish $HOME/dotfiles/.config/fish/
cp $HOME/.config/fish/functions/bwu.fish $HOME/dotfiles/.config/fish/functions/
cp $HOME/.config/cutefishos/cutefish-terminal.conf $HOME/dotfiles/.config/cutefishos/

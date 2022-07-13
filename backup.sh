#!/bin/sh

# Rclone
rclone sync -i $HOME/Documents/ gdrive:Documents
rclone sync -i $HOME/Pictures/ gdrive:Pictures

# Folders
cp -r $HOME/software/ $HOME/dotfiles/
cp -r $HOME/.config/flameshot/ $HOME/dotfiles/.config/
cp -r $HOME/.config/htop/ $HOME/dotfiles/.config/
cp -r $HOME/.config/omf/ $HOME/dotfiles/.config/
cp -r $HOME/.cinnamon/configs/ $HOME/dotfiles/.cinnamon/

# Files
cp $HOME/.config/fish/config.fish $HOME/dotfiles/.config/fish/

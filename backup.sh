# Rclone
rclone sync $HOME/Documents/ gdrive:Documents
rclone sync $HOME/Pictures/ gdrive:Pictures
rclone sync $HOME/Videos/ gdrive:Videos
rclone sync $HOME/Music/ gdrive:Music

# Folders
cp -r $HOME/.config/htop/ $HOME/dotfiles/.config/
cp -r $HOME/.config/omf/ $HOME/dotfiles/.config/
cp -r $HOME/.config/fish/ $HOME/dotfiles/.config/
cp -r $HOME/.config/ksnip/ $HOME/dotfiles/.config/

# Files
cp $HOME/.xbindkeysrc $HOME/dotfiles/
cp /etc/X11/xorg.conf.d/40-libinput.conf $HOME/dotfiles/
cp $HOME/.config/cutefishos/cutefish-terminal.conf $HOME/dotfiles/.config/cutefishos/
cp $HOME/.config/cutefishos/cutefish-filemanager.conf $HOME/dotfiles/.config/cutefishos/
cp $HOME/.config/cutefishos/dock.conf $HOME/dotfiles/.config/cutefishos/
cp $HOME/.config/cutefishos/power.conf $HOME/dotfiles/.config/cutefishos/
cp $HOME/.config/cutefishos/theme.conf $HOME/dotfiles/.config/cutefishos/
cp $HOME/.config/cutefishos/locale.conf $HOME/dotfiles/.config/cutefishos/
cp $HOME/.config/cutefishos/dock_pinned.conf $HOME/dotfiles/.config/cutefishos/
cp $HOME/.config/kwriterc $HOME/dotfiles/.config/
cp $HOME/.config/fcitx5/config $HOME/dotfiles/.config/fcitx5/
cp $HOME/.config/arkrc $HOME/dotfiles/.config/


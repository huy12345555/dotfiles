# Rclone
rclone sync ~/Documents/ gdrive:Documents
rclone sync ~/Pictures/ gdrive:Pictures
rclone sync ~/Videos/ gdrive:Videos
rclone sync ~/Music/ gdrive:Music

# Folders
cp -r ~/.config/{btop,omf,fish,ksnip,nomacs,Kingsoft,fcitx5,cutefishos} ~/dotfiles/.config/

# Files
cp ~/{.xbindkeysrc,.gitconfig} ~/dotfiles/
cp /etc/X11/xorg.conf.d/40-libinput.conf ~/dotfiles/
cp /etc/pacman.conf ~/dotfiles/
cp ~/.config/{kwriterc,arkrc,topgrade.toml} ~/dotfiles/.config/


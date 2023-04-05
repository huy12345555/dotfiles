# Rclone
rclone sync ~/Documents/ gdrive:Documents
rclone sync ~/Pictures/ gdrive:Pictures
rclone sync ~/Videos/ gdrive:Videos
rclone sync ~/Music/ gdrive:Music

# Folders
cp -r ~/.config/{btop,fish,Kingsoft,fcitx5} ~/dotfiles/.config/

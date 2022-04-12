#!/bin/sh

sudo pacman -Syyu
sudo pacman -S --needed - < $HOME/dotfiles/pkgs/core

# Disable bd brochot
sudo modprobe msr
sudo rdmsr 0x1FC
sudo wrmsr 0x1FC 0xFFFFE

# Setup folders
cp -r $HOME/dotfiles/scripts/ $HOME/
mkdir -p $HOME/Downloads/tmp/
mkdir -p $HOME/workspace/projects/

# Setup nvim
git clone https://github.com/giatrung2012/nvim $HOME/.config/nvim/

# Setup disable bd brochot for startup and wakeup
cd /
chmod +x $HOME/scripts/disable-bdprochot-wakeup
chmod +x $HOME/scripts/disable-bdprochot-wakeup.sh
chmod +x $HOME/scripts/disable-bdprochot-startup.sh
sudo chmod ugo+rwx /lib/systemd/system-sleep/
cp $HOME/scripts/disable-bdprochot-wakeup /lib/systemd/system-sleep/
sudo chmod ugo+rwx /etc/systemd/system/
cp $HOME/scripts/disable-bdprochot-startup.service /etc/systemd/system/
sudo systemctl enable disable-bdprochot-startup.service 

# Disable bluetooth
systemctl stop bluetooth
systemctl disable bluetooth

# NetworkManager
echo -e "\n[device]\nwifi.scan-rand-mac-address=no" | sudo tee -a /etc/NetworkManager/NetworkManager.conf > /dev/null

# Git config
git config --global user.email "trungrappar2002@gmail.com"
git config --global user.name "giatrung2012"

# Paru
cd $HOME/Downloads/tmp/
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si 
paru -S - < $HOME/dotfiles/pkgs/aur-core

# TLP
sudo systemctl enable tlp.service
sudo systemctl start tlp.service

# Config
cp -r $HOME/dotfiles/.config/ranger/ $HOME/.config/
cp -r $HOME/dotfiles/.config/btop/ $HOME/.config/
cp -r $HOME/dotfiles/.config/rclone/ $HOME/.config/

#!/bin/sh

sudo pacman -Syyu
sudo pacman -S --needed - < ./pkgs/core.txt

# Disable bd brochot
sudo modprobe msr
sudo rdmsr 0x1FC
sudo wrmsr 0x1FC 0xFFFFE

# Setup folders
cp -r software/ $HOME/
cp -r Pictures/ $HOME/
cp -r Documents/ $HOME/
cp -r Music/ $HOME/
cp -r Videos/ $HOME/
mkdir $HOME/Downloads/
mkdir $HOME/Downloads/tmp/
mkdir $HOME/workspace/
git clone https://github.com/giatrung2012/cpp $HOME/workspace/cpp/
git clone https://github.com/giatrung2012/java $HOME/workspace/java/
mkdir $HOME/workspace/projects/

#Setup nvim
trash-put $HOME/.config/nvim/
git clone https://github.com/giatrung2012/nvim $HOME/.config/nvim/

# Setup boost
cd /
chmod +x $HOME/software/boost
chmod +x $HOME/software/boost.sh
chmod +x $HOME/software/gboost.sh
sudo chmod ugo+rwx /lib/systemd/system-sleep/
mv $HOME/software/boost /lib/systemd/system-sleep/
sudo chmod ugo+rwx /etc/systemd/system/
mv $HOME/software/boost.service /etc/systemd/system/
sudo systemctl enable boost.service
sudo systemctl start boost.service

# Disable bluetooth
systemctl stop bluetooth
systemctl disable bluetooth

# NetworkManager
echo -e "\n[device]\nwifi.scan-rand-mac-address=no" | sudo tee -a /etc/NetworkManager/NetworkManager.conf > /dev/null

# Git config
git config --global user.email "trungrappar2002@gmail.com"
git config --global user.name "giatrung2012"

# Yay
cd $HOME/Downloads/tmp/
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# TLP
sudo systemctl enable tlp.service
sudo systemctl start tlp.service


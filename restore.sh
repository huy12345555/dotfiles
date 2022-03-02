#!/bin/sh

sudo pacman -Syyu

# Disable bd brochot
sudo pacman -S msr-tools
sudo modprobe msr
sudo rdmsr 0x1FC
sudo wrmsr 0x1FC 0xFFFFE

# Setup folders
cp -R software/ $HOME/
cp -R Pictures/ $HOME/
cp -R Documents/ $HOME/
cp -R Music/ $HOME/
cp -R Videos/ $HOME/
mkdir $HOME/Downloads/tmp/
mkdir $HOME/workspace/
git clone https://github.com/giatrung2012/cpp $HOME/workspace/cpp/
git clone https://github.com/giatrung2012/java $HOME/workspace/java/
mkdir $HOME/workspace/projects/

#Setup nvim
sudo pacman -S neovim
rm -r $HOME/.config/nvim/
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
echo "\n[device]\nwifi.scan-rand-mac-address=no" | sudo tee -a /etc/NetworkManager/NetworkManager.conf > dev/null

# Git config
git config --global user.email "trungrappar2002@gmail.com"
git config --global user.name "giatrung2012"

#!/bin/sh

yes | sudo pacman -Syyu

# Disable bd brochot
yes | sudo pacman -S msr-tools
sudo modprobe msr
sudo rdmsr 0x1FC
sudo wrmsr 0x1FC 0xFFFFE

# Install some official packages
yes | sudo pacman -S - < pkglist.txt

# Remove some packages
yes | sudo pacman -R - < pkglist-remove.txt

# Little setup throttlestop
sudo pip3 install throttlestop
echo "Go to https://github.com/agoose77/throttlestop then continue from Install service..."

# Setup folders and files
cp -R software/ $HOME/
cp -R Pictures/ $HOME/
cp -R Documents/ $HOME/
cp -R Music/ $HOME/
cp -R Desktop/ $HOME/

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

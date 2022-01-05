#!/bin/sh

sudo pacman -Syu

# Disable bd brochot
sudo pacman -S msr-tools
sudo modprobe msr
sudo rdmsr 0x1FC
sudo wrmsr 0x1FC 0xFFFFE

# Little setup throttlestop
sudo pacman -S python-pip
sudo pip3 install throttlestop
echo "Go to https://github.com/agoose77/throttlestop then continue from Install service..."

# Setup folder
cp -R software/ $HOME/
cp -R Pictures/ $HOME/
cp -R Documents/ $HOME/
cp -R Music/ $HOME/
cp -R Desktop/ $HOME/
cp -R workspace/ $HOME/
cp -R .themes/ $HOME/
cp -R .icons/ $HOME/
cp -R nvim/ $HOME/.config/

# Setup boost
cd /
chmod +x $HOME/software/boost
chmod +x $HOME/software/boost.sh
chmod +x $HOME/software/gboost.sh
chmod ugo+rwx /lib/systemd/system-sleep/
cp $HOME/software/boost /lib/systemd/system-sleep/
chmod ugo+rwx /etc/systemd/system/
cp $HOME/software/boost.service /etc/systemd/system/
sudo systemctl enable boost.service
sudo systemctl start boost.service


#!/bin/sh

sudo pacman -Syyu
sudo pacman -S --needed - < $HOME/dotfiles/pkgs/core

# Disable bd brochot
sudo modprobe msr
sudo rdmsr 0x1FC
sudo wrmsr 0x1FC 0xFFFFE

# Setup folders
cp -r $HOME/dotfiles/software/ $HOME/
mkdir $HOME/{Documents,Pictures,Music,Videos}
mkdir -p $HOME/Downloads/{tmp,Documents,Videos}
git clone https://github.com/giatrung2012/learn $HOME/workspace/
mkdir -p $HOME/workspace/projects/

# Setup nvim
git clone https://github.com/giatrung2012/nvim $HOME/.config/nvim/

# Setup disable bd brochot for startup and wakeup
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
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
cp -r $HOME/dotfiles/.config/ $HOME/
cp $HOME/dotfiles/.xbindkeysrc $HOME/

# Fcitx5
echo -e "\n# fcitx5\nGTK_IM_MODULE=fcitx\nQT_IM_MODULE=fcitx\nXMODIFIERS=@im=fcitx" | sudo tee -a /etc/environment > /dev/null

# Touchpad
sudo cp $HOME/dotfiles/40-libinput.conf /etc/X11/xorg.conf.d/

# Cutefish sddm theme
sudo cp -r $HOME/dotfiles/cutefish/ /usr/share/sddm/themes/

# Cutefish cursor
sudo cp $HOME/dotfiles/index.theme /usr/share/icons/default/

# Fonts
sudo fc-cache -fv

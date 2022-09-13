sudo pacman -Syyu

# Disable bd brochot
sudo pacman -S msr-tools
sudo modprobe msr
sudo rdmsr 0x1FC
sudo wrmsr 0x1FC 0xFFFFE

# Core packages
sudo pacman -S --needed - < $HOME/dotfiles/packages/core.txt

# Setup folders
cp -r $HOME/dotfiles/disable-bd-prochot/ $HOME
mkdir $HOME/{Documents,Pictures,Music,Videos,workspace}

# Nvim
git clone https://github.com/giatrung2012/nvim $HOME/.config/nvim/

# Setup disable bd brochot for startup and wakeup
chmod +x $HOME/disable-bd-prochot/boost-wakup
chmod +x $HOME/disable-bd-prochot/boost-wakup.sh
chmod +x $HOME/disable-bd-prochot/boost-startup.sh
sudo chmod ugo+rwx /lib/systemd/system-sleep/
mv $HOME/disable-bd-prochot/boost-wakup /lib/systemd/system-sleep/
sudo chmod ugo+rwx /etc/systemd/system/
mv $HOME/disable-bd-prochot/boost-startup.service /etc/systemd/system/
sudo systemctl enable boost-startup.service 
sudo systemctl start boost-startup.service

# Disable bluetooth
systemctl stop bluetooth
systemctl disable bluetooth

# NetworkManager
echo -e "\n[device]\nwifi.scan-rand-mac-address=no" | sudo tee -a /etc/NetworkManager/NetworkManager.conf > /dev/null

# Git config
git config --global user.email "trunghsg2012@gmail.com"
git config --global user.name "giatrung2012"
git config --global core.editor nvim

# Paru
git clone https://aur.archlinux.org/paru.git $HOME/Downloads/paru/
cd $HOME/Downloads/paru/
makepkg -si 
paru -S - < $HOME/dotfiles/packages/aur.txt

# TLP
sudo systemctl enable tlp.service
sudo systemctl start tlp.service

# Config
cp -r $HOME/dotfiles/.config/ $HOME
cp $HOME/dotfiles/.xbindkeysrc $HOME

# Fcitx5
echo -e "\n# Fcitx5\nGTK_IM_MODULE=fcitx\nQT_IM_MODULE=fcitx\nXMODIFIERS=@im=fcitx" | sudo tee -a /etc/environment > /dev/null

# Remove some packages
sudo pacman -Rs - < $HOME/dotfiles/packages/remove.txt

# Fix touchpad
sudo cp $HOME/dotfiles/40-libinput.conf /etc/X11/xorg.conf.d/

# Cutefish sddm theme
git clone https://github.com/cutefishos/sddm-theme $HOME/Downloads/sddm-theme/
cd $HOME/Downloads/sddm-theme/
mkdir build
cd build
cmake ..
make
sudo make install

# Cutefish cursor
sudo cp $HOME/dotfiles/index.theme /usr/share/icons/default/

# Fonts
sudo fc-cache -fv

# Fish
chsh -s /usr/bin/fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
omf install agnoster


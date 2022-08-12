sudo pacman -Syyu

# Disable bd brochot
sudo pacman -S msr-tools
sudo modprobe msr
sudo rdmsr 0x1FC
sudo wrmsr 0x1FC 0xFFFFE

# Core packages
sudo pacman -S --needed - < $HOME/dotfiles/packages/core.txt

# Setup folders
cp -r $HOME/dotfiles/software/ $HOME
mkdir $HOME/{Documents,Pictures,Music,Videos,workspace}
mkdir -p $HOME/Downloads/{tmp,Documents,Videos}

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
git config --global user.email "trunghsg2012@gmail.com"
git config --global user.name "giatrung2012"
git config --global core.editor nvim

# Paru
cd $HOME/Downloads/tmp/
git clone https://aur.archlinux.org/paru.git
cd paru
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

# Touchpad
sudo cp $HOME/dotfiles/40-libinput.conf /etc/X11/xorg.conf.d/

# Cutefish sddm theme
sudo cp -r $HOME/dotfiles/cutefish/ /usr/share/sddm/themes/

# Cutefish cursor
sudo cp $HOME/dotfiles/index.theme /usr/share/icons/default/

# Fonts
sudo fc-cache -fv

# Fish
chsh -s /usr/bin/fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
omf install agnoster

# Make web app show
sudo chmod ugo+rwx /usr/share/applications/

# Stuhack
git clone https://github.com/isanchop/stuhack.git $HOME/Downloads/tmp/stuhack


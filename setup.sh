sudo pacman -Syyu --noconfirm

# Disable bd brochot
sudo pacman -S msr-tools --noconfirm
sudo modprobe msr
r=`sudo rdmsr 0x1FC`
s='0x'$r'' 
f=$(($s&0xFFFFE))
sudo wrmsr 0x1FC "obase=16;$f"|bc
echo "$r"" write to ""reg 0x1FC" 
echo "BD PROCHOT off."

# Core packages
sudo pacman -S --needed - < ~/dotfiles/packages/core.txt --noconfirm

# Setup folders
# mkdir ~/{Documents,Pictures,Music,Videos,workspace}
mkdir ~/temp
ln -s /run/media/giatrung2012/Windows/Users/giatrung2012/{Documents,Pictures,Downloads,Music,Videos,workspace} ~/

# Setup disable bd prochot for startup and wakeup
chmod +x ~/disable-bd-prochot/{boost-wakup,boost-wakup.sh,boost-startup.sh}
sudo chmod 777 /lib/systemd/system-sleep/
cp ~/dotfiles/disable-bd-prochot/boost-wakup /lib/systemd/system-sleep/
sudo chmod 755 /lib/systemd/system-sleep/
sudo chmod 777 /etc/systemd/system/
cp ~/dotfiles/disable-bd-prochot/boost-startup.service /etc/systemd/system/
sudo chmod 755 /etc/systemd/system/
sudo systemctl enable boost-startup.service 

# Disable bluetooth
sudo systemctl stop bluetooth
sudo systemctl disable bluetooth

# NetworkManager
echo -e "\n[device]\nwifi.scan-rand-mac-address=no" | sudo tee -a /etc/NetworkManager/NetworkManager.conf > /dev/null

# Paru
git clone https://aur.archlinux.org/paru.git ~/temp/paru/
cd ~/temp/paru/
makepkg -si
paru -S ttf-ms-fonts authy nerd-fonts-jetbrains-mono microsoft-edge-stable-bin cutefish-gtk-themes-git cutefish-cursor-themes-git aur-auto-vote-git redshift-minimal cloudflare-warp-bin topgrade  

# LunarVim
LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
trash-put ~/.config/lvim/
git clone https://github.com/giatrung2012/lvim ~/.config/lvim/

# Config
cp -r ~/dotfiles/.config/ ~/
cp ~/dotfiles/{.xbindkeysrc,.gitconfig} ~/
sudo cp ~/dotfiles/pacman.conf /etc/

# Fcitx5
echo -e "\n# Fcitx5\nGTK_IM_MODULE=fcitx\nQT_IM_MODULE=fcitx\nXMODIFIERS=@im=fcitx" | sudo tee -a /etc/environment > /dev/null

# Fix touchpad
sudo cp ~/dotfiles/40-libinput.conf /etc/X11/xorg.conf.d/

# Cutefish sddm theme
git clone https://github.com/cutefishos/sddm-theme ~/temp/sddm-theme/
cd ~/Downloads/sddm-theme/
mkdir build
cd build
cmake ..
make
sudo make install

# Cutefish cursor theme
sudo cp ~/dotfiles/index.theme /usr/share/icons/default/

# Fonts
sudo fc-cache -fv

# WARP CLI
sudo systemctl start warp-svc.service
warp-cli register
sudo systemctl stop warp-svc.service

# AUR Auto Vote
aur-auto-vote giatrung2012

# Fish
chsh -s /usr/bin/fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
omf install agnoster

# Remove temp folder
trash-put ~/temp/


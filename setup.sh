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

# Packages
# sudo pacman -Rs - < ~/dotfiles/packages/remove.txt --noconfirm
sudo pacman -S - < ~/dotfiles/packages/core.txt --needed --noconfirm

# Folders
mkdir ~/tmp
trash-put ~/{Documents,Pictures,Downloads,Music,Videos}
ln -s /run/media/giatrung2012/Windows/Users/giatrung2012/{Documents,Pictures,Downloads,Music,Videos,workspace} ~/

# Disable bd prochot on startup and wakeup
chmod +x ~/dotfiles/disable-bd-prochot/{boost-wakup,boost-wakup.sh,boost-startup.sh}
sudo chmod 777 /lib/systemd/system-sleep/
cp ~/dotfiles/disable-bd-prochot/boost-wakup /lib/systemd/system-sleep/
sudo chmod 755 /lib/systemd/system-sleep/
sudo chmod 777 /etc/systemd/system/
cp ~/dotfiles/disable-bd-prochot/boost-startup.service /etc/systemd/system/
sudo chmod 755 /etc/systemd/system/
sudo systemctl enable boost-startup.service

# NetworkManager
echo -e "\n[device]\nwifi.scan-rand-mac-address=no" | sudo tee -a /etc/NetworkManager/NetworkManager.conf > /dev/null

# Paru
git clone https://aur.archlinux.org/paru-bin.git ~/temp/paru-bin/
cd ~/temp/paru-bin/
makepkg -si
cat ~/dotfiles/packages/aur.txt | xargs paru -S --needed --noconfirm

# LunarVim
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
trash-put ~/.config/lvim
git clone https://github.com/giatrung2012/lvim ~/.config/lvim/

# Config
cp -r ~/dotfiles/.config/ ~/
cp ~/dotfiles/.gitconfig ~/

# Fcitx5
echo -e "\n# Fcitx5\nGTK_IM_MODULE=fcitx\nQT_IM_MODULE=fcitx\nXMODIFIERS=@im=fcitx" | sudo tee -a /etc/environment > /dev/null

# Clear pacman cache
sudo systemctl enable paccache.timer

# Firewall
sudo systemctl start ufw.service
sudo systemctl enable ufw.service
sudo ufw default deny
sudo ufw allow from 192.168.0.0/24
sudo ufw allow Deluge
sudo ufw limit ssh
sudo ufw enable

# GNOME
gnome-extensions enable $(gnome-extensions list | grep -m 1 appindicatorsupport)

# Fonts
sudo fc-cache -f

# Fish
chsh -s /usr/bin/fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
omf install agnoster

# Remove temp folder
trash-put ~/tmp/


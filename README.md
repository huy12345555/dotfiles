## Table of Contents
1. [Basic](#basic)
2. [IBus Bamboo](#ibus-bamboo)
3. [Github CLI](#github-cli)
4. [Nvim as root](#nvim-as-root)
5. [Fish](#fish)

## Basic
- Make this repo public then private later
    ```shell
    git clone https://github.com/giatrung2012/backup $HOME/backup/
    ```
- Restore
    ```shell
    cd $HOME/backup/
    ./restore.sh
    ```

## IBus Bamboo
```shell
yay -S ibus-bamboo
echo -e "\n# ibus-bamboo\nexport GTK_IM_MODULE=ibus\nexport QT_IM_MODULE=ibus\nexport XMODIFIERS=@im=ibus\nexport QT4_IM_MODULE=ibus\nexport CLUTTER_IM_MODULE=ibus\nibus-daemon -drx" | sudo tee -a /etc/profile > /dev/null
echo -e "\n# ibus-bamboo\nGTK_IM_MODULE=ibus\nQT_IM_MODULE=ibus\nXMODIFIERS=@im=ibus" | sudo tee -a /etc/environment > /dev/null
ibus-setup
```
- Ibus Preferences -> Input Method -> Add -> English -> Bamboo -> Add -> Vietnamese -> Bamboo
- Logout then login

## Github CLI
```shell
gh auth login
```
- When prompted for your preferred protocol for Git operations, select HTTPS.
- When asked if you would like to authenticate to Git with your GitHub credentials, enter Y. 

## Nvim as root
```shell
sudo su
trash-put /root/.config/nvim/
git clone https://github.com/giatrung2012/nvim /root/.config/nvim/
exit
```

## Fish
```shell
chsh -s /usr/bin/fish
```
- Logout then login
```shell
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
omf install agnoster
echo -e "\nset fish_greeting" >> $HOME/.config/fish/config.fish
```

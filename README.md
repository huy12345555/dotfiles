## Table of Contents
1. [Setup](#setup)
2. [Fcitx5](#fcitx5)
3. [Fish](#fish)
4. [Cutefish sddm theme](#cutefish-sddm-theme)
5. [Cutefish cursor](#cutefish-cursor)
6. [Github CLI](#github-cli)
7. [Bitwarden CLI](#bitwarden-cli)
8. [Pacman & paru](#pacman-and-paru)
9. [Nvim as root](#nvim-as-root)
10. [Ngrok](#ngrok)

## Setup
```shell
git clone https://github.com/giatrung2012/dotfiles $HOME/
cd $HOME/dotfiles/
./restore.sh
```

## Fcitx5
- Logout then login
- Fcitx5 Configuration -> Add unikey

## Fish
```shell
chsh -s /usr/bin/fish
```
- Logout then login
```shell
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
omf install agnoster
```

## Cutefish sddm theme
- `sddm-config-editor` -> themes -> cutefish

## Cutefish cursor
- Restart X

## Github CLI
```shell
gh auth login
```
- When prompted for your preferred protocol for Git operations, select **HTTPS**.
- When asked if you would like to authenticate to Git with your GitHub credentials, enter **Y**. 

## Bitwarden CLI
```shell
bw login --apikey
```
- Log in to the [Web Vault](https://vault.bitwarden.com) and select the **Settings** tab.
- From the **My Account** screen, scroll down to the **API Key** section.
- Select the **View API** Key button and enter your Master Password to validate access.
- From the **API Key** dialog box, copy the **client_secret**: value

## Pacman & paru
- Uncomment Color, ParallelDownloads & add ILoveCandy in /etc/pacman.conf
- Uncomment BottomUp in /etc/paru.conf

## Nvim as root
```shell
sudo su
git clone https://github.com/giatrung2012/nvim /root/.config/nvim/
nvim +PackerSync
```

## Ngrok
- https://dashboard.ngrok.com/get-started/setup
```shell
ngrok http 127.0.0.1:5500 -host-header="127.0.0.1:5500"
```

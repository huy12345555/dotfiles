## Table of Contents
1. [Basic](#basic)
2. [Fcitx5](#fcitx5)
3. [Github CLI](#github-cli)
4. [Nvim as root](#nvim-as-root)
5. [Bitwarden CLI](#bitwarden-cli)
6. [Cutefish sddm theme](#cutefish-sddm-theme)
7. [Cutefish cursor](#cutefish-cursor)
8. [Ngrok](#ngrok)

## Basic
-  Don't run at root user
```shell
git clone https://github.com/giatrung2012/dotfiles $HOME/
cd $HOME/dotfiles/
./restore.sh
```

## Fcitx5
- Logout then login
- Fcitx5 Configuration -> Add unikey

## Github CLI
```shell
gh auth login
```
- When prompted for your preferred protocol for Git operations, select **HTTPS**.
- When asked if you would like to authenticate to Git with your GitHub credentials, enter **Y**. 

## Nvim as root
```shell
sudo su
git clone https://github.com/giatrung2012/nvim /root/.config/nvim/
nvim +PackerSync
```

## Fish
```shell
chsh -s /usr/bin/fish
```
- Logout then login
```shell
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
omf install agnoster
```

## Bitwarden CLI
```shell
bw login --apikey
```
- Log in to the [Web Vault](https://vault.bitwarden.com) and select the **Settings** tab.
- From the **My Account** screen, scroll down to the **API Key** section.
- Select the **View API** Key button and enter your Master Password to validate access.
- From the **API Key** dialog box, copy the **client_secret**: value

## Cutefish sddm theme
- Run sddm-config-editor -> themes -> cutefish

## Cutefish cursor
- Restart X

## Ngrok
- https://dashboard.ngrok.com/get-started/setup
```shell
ngrok http 127.0.0.1:5500 -host-header="127.0.0.1:5500"
```

## Table of Contents
1. [Setup](#setup)
2. [Fcitx5](#fcitx5)
3. [Fish](#fish)
4. [Github CLI](#github-cli)
5. [Pacman & paru](#pacman-and-paru)

## Setup
```shell
git clone https://github.com/giatrung2012/dotfiles
cd dotfiles/
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

## Github CLI
```shell
gh auth login
```
- When prompted for your preferred protocol for Git operations, select **HTTPS**.
- When asked if you would like to authenticate to Git with your GitHub credentials, enter **Y**. 

## Pacman & paru
- Uncomment Color, ParallelDownloads & add ILoveCandy in /etc/pacman.conf
- Uncomment BottomUp in /etc/paru.conf

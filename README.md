## Table of Contents
1. [Setup](#setup)
2. [Github CLI](#github-cli)
3. [Pacman & paru](#pacman-and-paru)
4. [AUR Auto Vote](#aur-auto-vote)
5. [WARP CLI](#warp-cli)

## Setup
```shell
git clone https://github.com/giatrung2012/dotfiles
cd dotfiles/
./setup.sh
```

## Github CLI
```shell
gh auth login
```

## Pacman & paru
- Uncomment Color, ParallelDownloads & add ILoveCandy in /etc/pacman.conf
- Uncomment BottomUp in /etc/paru.conf

## AUR Auto Vote
```shell
aur-auto-vote username
```

## WARP CLI
```shell
sudo systemctl start warp-svc.service
warp-cli register
```

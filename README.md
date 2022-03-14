## Table of Contents
1. [Basic](#basic)
2. [Fcitx5](#fcitx5)
3. [Github CLI](#github-cli)
4. [Nvim as root](#nvim-as-root)
5. [Touchpad] (#touchpad)

## Basic
- Make this repo public then private later
    ```shell
    git clone https://github.com/giatrung2012/backup $HOME/
    ```
- Restore
    ```shell
    cd $HOME/backup/
    ./restore.sh
    ```

## Fcitx5
```shell
echo -e "\n# fcitx5\nGTK_IM_MODULE=fcitx\nQT_IM_MODULE=fcitx\nXMODIFIERS=@im=fcitx" | sudo tee -a /etc/environment > /dev/null
```
- Logout then login
- Fcitx5 Configuration -> Add unikey

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
nvim +PackerSync
```

## Fish
```shell
chsh -s /usr/bin/fish
cp -r $HOME/backup/.config/fish/ $HOME/.config/
```
- Logout then login
```shell
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
```
```shell
omf install agnoster
omf theme agnoster
```

## Touchpad
```shell
sudo cp $HOME/backup/40-libinput.conf /etc/X11/xorg.conf.d/
```

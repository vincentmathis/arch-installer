#!/bin/sh

sudo pacman -S --noconfirm --needed base-devel yadm

### install yay AUR helper
cd "$HOME"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg --noconfirm -si
cd ..
rm -rf yay

### source github creds from cfg or prompt user
SCRIPT=$(realpath "$0")
FILE=$(dirname "$SCRIPT")'/.env'
if [ -f $FILE ]; then
    source $FILE
else
    read -p 'GitHub Username: ' GITHUB_USER
    read -sp 'GitHub Access Token: ' GITHUB_TOKEN
fi

### clone dotfiles
yadm clone --bootstrap https://$GITHUB_USER:$GITHUB_TOKEN@github.com/vincentmathis/dotfiles.git

### decrypt ssh key
yadm decrypt

### change yadm to ssh
yadm remote set-url origin git@github.com:vincentmathis/dotfiles.git

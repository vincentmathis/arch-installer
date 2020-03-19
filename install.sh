#!/bin/sh

sudo pacman --noconfirm -S keepassxc nextcloud-client

cd "$HOME"

### install yay AUR helper
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

### install yadm
yay -S --answerclean y --answerdiff n yadm-git

### clone dotfiles
yadm clone --bootstrap https://github.com/vincentmathis/dotfiles.git
yadm drop stash
yadm decrypt

# https://github.com/MatMoul/archfi
# https://github.com/MatMoul/archdi
# https://github.com/tom5760/arch-install
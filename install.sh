#!/bin/sh

sudo pacman -S --needed base-devel

cd "$HOME"

### install yay AUR helper
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg --noconfirm -si
cd ..
rm -rf paru

### install yadm
sudo pacman -S --noconfirm yadm

### clone dotfiles
yadm clone --bootstrap https://github.com/vincentmathis/dotfiles.git
yadm decrypt

# https://github.com/MatMoul/archfi
# https://github.com/MatMoul/archdi
# https://github.com/tom5760/arch-install

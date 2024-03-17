#!/bin/bash

yes | sudo pacman -S --needed base-devel get neovim
git clone https://aur.archlinux.org/paru.git
cd paru && yes | makepkg -si
cd .. && rm -rf paru

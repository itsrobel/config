#!/usr/bin/env

sudo pacman-mirrors --fasttrack && sudo pacman -Syu
sudo pacman -Syyu

yay -i paru

paru -S alacritty awesome qtile rofi nitrogen base-devel obsidian emacs dracula-icons-git  dracula-gtk-theme eza spotify microsoft-edge-stable-bin google-messages

sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R


yay -i spicetify-cli

gsettings set org.gnome.desktop.interface gtk-theme "Dracula"
gsettings set org.gnome.desktop.interface icon-theme 'Dracula'

git clone https://github.com/amarshavir/config ~/Documents/

cp -r ~/Documents/config/.face ~/
cp -r ~/Documents/config/alacritty ~/.config/
cp -r ~/Documents/config/fish ~/.config/
cp -r ~/Documents/config/rofi ~/.config/
cp -r ~/Documents/config/qtile ~/.config/
cp -r ~/Documents/config/.doom.d ~/.config/
cp -r ~/Documents/config/awesome ~/.config/



cp -r ~/Documents/config/spicetify/Dracula ~/.config/spicetify/Themes/

spicetify config current_theme Dracula
spicetify backup apply
spicetify apply

chsh -s $(which fish)
git config --global user.email "itsrobel.schwarz@gmail.com" && git config --global user.name "Robel Schwarz"
# sudo reboot

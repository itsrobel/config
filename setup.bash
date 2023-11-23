#!/usr/bin/env

sudo pacman-mirrors --fasttrack && sudo pacman -Syu
sudo pacman -Syyu
sudo pacman -S awesome rofi nitrogen base-devel emacs
sudo pacman -S dracula-icons-git lxapperance dracula-gtk-theme
sudo pacman -S eca spotify microsoft-edge-stable-bin
sudo pacman -S google-messages

sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R



sudo pacman -S spicetify-cli

gsettings set org.gnome.desktop.interface gtk-theme "Dracula"
gsettings set org.gnome.desktop.interface icon-theme 'Dracula'

sudo pacman -S lightdm-webkit-theme-aether
sudo cp tree.jpg /usr/share/lightdm-webkit/themes/lightdm-webkit-theme-aether/src/img/wallpapers/

git clone https://github.com/amarshavir/config ~/Documents/

cp -r ~/Documents/config/.face ~/
cp -r ~/Documents/config/alacritty ~/.config/
cp -r ~/Documents/config/fish ~/.config/
cp -r ~/Documents/config/rofi ~/.config/
cp -r ~/Documents/config/.doom.d ~/.config/
cp -r ~/Documents/config/spicetify/Dracula ~/.config/spicetify/Themes/

spicetify config current_theme Dracula
spicetify backup apply
spicetify apply

cp -r ~/Documents/config/awesome ~/.config/
chsh -s $(which fish)
git config --global user.email "itsrobel.schwarz@gmail.com" && git config --global user.name "Robel Schwarz"
sudo reboot

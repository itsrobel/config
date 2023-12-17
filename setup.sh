#!/usr/bin/env
#config file for endeavor
#sudo pacman-mirrors --fasttrack && sudo pacman -Syu
sudo pacman -Syyu

yay -i paru

paru -S thunderbird picom fish spicetify-cli alacritty awesome qtile rofi nitrogen base-devel lxappearance obsidian emacs dracula-icons-git  dracula-gtk-theme eza spotify microsoft-edge-stable-bin google-messages lemurs



#because dooom emacs
paru -S shellcheck marked ripgrep fd
#
#
#python tools
paru -S python-setuptools python-pipenv python-isort python-pytest python-nose



sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R



gsettings set org.gnome.desktop.interface gtk-theme "Dracula"
gsettings set org.gnome.desktop.interface icon-theme 'Dracula'

git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install

cp -r ~/Documents/config/.face ~/
cp -r ~/Documents/config/alacritty ~/.config/
cp -r ~/Documents/config/fish ~/.config/
cp -r ~/Documents/config/rofi ~/.config/
cp -r ~/Documents/config/qtile ~/.config/
cp -r ~/Documents/config/doom ~/.config/
cp -r ~/Documents/config/awesome ~/.config/
cp -r ~/Documents/config/spotify ~/.config/



sudo cp -r ~/Documents/config/lemurs /etc/
sudo cp ~/Documents/config/paru.conf /etc/
sudo cp ~/Documents/config/pacman.conf /etc/


cp -r ~/Documents/config/spicetify/Dracula ~/.config/spicetify/Themes/

spicetify config current_theme Dracula
spicetify backup apply
spicetify apply



chsh -s $(which fish)


git config --global user.email "itsrobel.schwarz@gmail.com" && git config --global user.name "Robel Schwarz"
git config --global credential.helper store
sudo systemctl enable lemurs
sudo reboot

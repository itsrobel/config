#!/usr/bin/env
#config file for endeavor
#sudo pacman-mirrors --fasttrack && sudo pacman -Syu
sudo pacman -Syyu

yay -i paru
# System
paru -S network-manager-applet picom alacritty fish awesome rofi base-devel lemurs

# Dooom Emacs
paru -S shellcheck marked ripgrep fd hunspell-en_us cmake emacs

# Tools
paru -S fastfetch thunderbird spotify google-messages obsidian microsoft-edge-stable-bin  eza
# Themes
paru -S spicetify-cli lxappearance dracula-gtk-theme nitrogen dracula-icons-git
# Programming langauges
paru -S jdk
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
cp -r ~/Documents/config/nvim ~/.config/
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

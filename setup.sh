#!/usr/bin/env
#config file for endeavor
#sudo pacman-mirrors --fasttrack && sudo pacman -Syu
sudo pacman -Syyu

yay -i paru
# System
paru -S acpilight network-manager-applet picom alacritty fish awesome rofi base-devel thunar thunar-volman gvfs gvfs-afc lemurs qt5ct

# Dooom Emacs
paru -S shellcheck marked ripgrep fd hunspell-en_us cmake emacs

# Tools
paru -S fastfetch thunderbird spotify google-messages obsidian microsoft-edge-stable-bin cava eza
# Themes
paru -S spicetify-cli lxappearance dracula-gtk-theme nitrogen dracula-icons-git
# Programming langauges
paru -S jdk
#
#python tools
paru -S python-setuptools python-pipenv python-isort python-pytest python-nose


# Pdflatex
paru -S texlive-latex texlive-latexextra texlive-plaingeneric


# Read Write Spotify
sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R

# Set gtk theme to dracula
gsettings set org.gnome.desktop.interface gtk-theme "Dracula"
gsettings set org.gnome.desktop.interface icon-theme 'Dracula'

# Install doom emacs
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install

# set all config files
cp -r ~/Documents/config/.face ~/
cp -r ~/Documents/config/alacritty ~/.config/
cp -r ~/Documents/config/fish ~/.config/
cp -r ~/Documents/config/rofi ~/.config/
cp -r ~/Documents/config/qtile ~/.config/
cp -r ~/Documents/config/doom ~/.config/
cp -r ~/Documents/config/awesome ~/.config/
cp -r ~/Documents/config/nvim ~/.config/
cp -r ~/Documents/config/spotify ~/.config/
cp -r ~/Documents/config/qt5ct ~/.config/
cp -r ~/Documents/config/cava ~/.config/

sudo cp -r ~/Documents/config/lemurs /etc/
sudo cp ~/Documents/config/paru.conf /etc/
sudo cp ~/Documents/config/pacman.conf /etc/


cp -r ~/Documents/config/spicetify/Dracula ~/.config/spicetify/Themes/

# set spotify theme to dracula
spicetify config current_theme Dracula
spicetify backup apply
spicetify apply

# add user to video group enabling xbacklight
sudo gpasswd -a $(whoami) video
# set default shell to fish
chsh -s $(which fish)

# set git config
git config --global user.email "itsrobel.schwarz@gmail.com" && git config --global user.name "Robel Schwarz"
git config --global credential.helper store


# UNCOMMENT FOR LAPTOP
# install auto-cpufreq

# paru -S auto-cpufreq
# sudo auto-cpufreq --install


# set display manager
sudo systemctl enable lemurs
sudo reboot

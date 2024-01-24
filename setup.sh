#!/usr/bin/env
#config file for endeavor


# set all config files
ln -s $(pwd)/conf/.face ~/
ln -s $(pwd)/conf/.Xresources ~/
ln -s $(pwd)/conf/.zshrc ~/
ln -s $(pwd)/alacritty ~/.config/
ln -s $(pwd)/fish ~/.config/
ln -s $(pwd)/rofi ~/.config/
ln -s $(pwd)/qtile ~/.config/
ln -s $(pwd)/awesome ~/.config/
ln -s $(pwd)/nvim ~/.config/
ln -s $(pwd)/doom ~/.config/
ln -s $(pwd)/qt5ct ~/.config/
ln -s $(pwd)/cava ~/.config/
ln -s $(pwd)/zathura ~/.config/
ln -s $(pwd)/ranger ~/.config/




ln -s $(pwd)/bashtop/dracula.theme ~/.config/bashtop/user_themes/
ln -s $(pwd)/pandoc ~/.local/share/

ln -s $(pwd)/wallpapers ~/Pictures/


sudo cp -r $(pwd)/lemurs /etc/
sudo cp $(pwd)/conf/paru.conf /etc/
#sudo cp $(pwd)/conf/pacman.conf /etc/


ln -s $(pwd)/spicetify/Dracula ~/.config/spicetify/Themes/Dracula



#sudo pacman-mirrors --fasttrack && sudo pacman -Syu
#
sudo pacman -Syyu



paru -S $(cat packages.sh | cut -d' ' -f1) --needed


# System
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install


sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting



# Read Write Spotify
sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R

# Set gtk theme to dracula
gsettings set org.gnome.desktop.interface gtk-theme "Dracula"
gsettings set org.gnome.desktop.interface icon-theme 'Dracula'


# set spotify theme to dracula
spicetify config current_theme Dracula
spicetify backup apply
spicetify apply

# add user to video group enabling xbacklight
sudo gpasswd -a $(whoami) video
# set default shell to fish
chsh -s $(which zsh)

set git config
git config --global user.email "itsrobel.schwarz@gmail.com" && git config --global user.name "Robel Schwarz"
git config --global credential.helper store



# UNCOMMENT FOR LAPTOP
# install auto-cpufreq

# paru -S auto-cpufreq
# sudo auto-cpufreq --install


# set display manager
sudo systemctl enable lemurs

# enable onedrive systemd
# systemctl --user enable onedrive
# systemctl --user start onedrive



sudo reboot

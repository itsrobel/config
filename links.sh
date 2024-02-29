#!/usr/bin/env
# set all config files
ln -s $(pwd)/conf/.face ~/
ln -s $(pwd)/conf/.Xresources ~/
ln -s $(pwd)/conf/.zshrc ~/
ln -s $(pwd)/alacritty ~/.config/
ln -s $(pwd)/fish ~/.config/
ln -s $(pwd)/rofi ~/.config/
ln -s $(pwd)/awesome ~/.config/
ln -s $(pwd)/qtile ~/.config/
ln -s $(pwd)/spicetify ~/.config/
ln -s $(pwd)/nvim ~/.config/
ln -s $(pwd)/doom ~/.config/
ln -s $(pwd)/qt5ct ~/.config/
ln -s $(pwd)/cava ~/.config/
ln -s $(pwd)/zathura ~/.config/
ln -s $(pwd)/ranger ~/.config/
ln -s $(pwd)/nvchad ~/.config/nvim/lua/custom

ln -s $(pwd)/bashtop/dracula.theme ~/.config/bashtop/user_themes/
ln -s $(pwd)/pandoc ~/.local/share/

ln -s $(pwd)/wallpapers ~/Pictures/
ln -s $(pwd)/spicetify/Dracula ~/.config/spicetify/Themes/Dracula

sudo cp -r $(pwd)/lemurs /etc/
sudo cp $(pwd)/conf/paru.conf /etc/

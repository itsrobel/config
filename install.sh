#!/bin/bash

# Arch Linux Installation and Configuration Script

# Error handling
set -e
trap 'echo "Error occurred at line $LINENO. Exit status: $?"' ERR

# System Update and Base Packages
sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm \
    base-devel git wget curl \
    zsh neovim tmux \
    ripgrep fd tree-sitter eza zoxide \
    lua51 luarocks \
    rust ruby julia php \
    nodejs npm \
    noto-fonts noto-fonts-emoji \
    lightdm lightdm-gtk-greeter \
    kvantum pulseaudio pulseaudio-alsa pavucontrol \
    sof-firmware alsa-firmware alsa-utils

# Install yay AUR helper
if ! command -v yay &> /dev/null; then
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
fi

# Install AUR packages
yay -S --noconfirm \
    nerd-fonts-sf-mono \
    ttf-font-icons \
    full-dracula-theme-git

# Font Setup
mkdir -p ~/.local/share/fonts
git clone https://github.com/shaunsingh/SFMono-Nerd-Font-Ligaturized.git
cp SFMono-Nerd-Font-Ligaturized/*.otf ~/.local/share/fonts/
rm -rf SFMono-Nerd-Font-Ligaturized
fc-cache -fv

# GNOME Font Settings
gsettings set org.gnome.desktop.interface font-name 'SF Mono Nerd Font 11'
gsettings set org.gnome.desktop.interface monospace-font-name 'SF Mono Nerd Font 10'

# ZSH Configuration
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# ZSH plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# GTK and Theming Setup
mkdir -p ~/.config/{gtk-3.0,gtk-4.0,Kvantum,qt5ct}

# GTK3 Settings
cat > ~/.config/gtk-3.0/settings.ini << EOF
[Settings]
gtk-theme-name=Dracula
gtk-font-name=SF Mono Nerd Font 10
EOF

# Copy settings for GTK4
cp ~/.config/gtk-3.0/settings.ini ~/.config/gtk-4.0/

# Kvantum Configuration
echo "theme=Dracula" > ~/.config/Kvantum/kvantum.kvconfig

# Qt5 Configuration
cat > ~/.config/qt5ct/qt5ct.conf << EOF
[Appearance]
style=kvantum
font="SF Mono Nerd Font,10,-1,5,50,0,0,0,0,0"
EOF

# Qt Environment Variables
echo "export QT_QPA_PLATFORMTHEME=qt5ct" >> ~/.profile

# GNOME Theme Settings
gsettings set org.gnome.desktop.interface gtk-theme "Dracula"
gsettings set org.gnome.desktop.wm.preferences theme "Dracula"
gsettings set org.gnome.desktop.interface icon-theme "Dracula"

# LightDM Configuration
sudo tee /etc/lightdm/lightdm-gtk-greeter.conf << EOF
[greeter]
theme-name = Dracula
font-name = SF Mono Nerd Font 10
active-monitor = #cursor
EOF

# Enable LightDM
sudo systemctl enable lightdm

# Install global npm packages
sudo npm install -g neovim

# Clean up potential pulseaudio conflicts
sudo rm -f /usr/lib/systemd/user/pulseaudio-x11.service
sudo rm -f /usr/lib/systemd/user/pulseaudio.service
sudo rm -f /usr/lib/systemd/user/pulseaudio.socket
sudo rm -f /usr/lib/udev/rules.d/90-pulseaudio.rules
sudo rm -f /usr/share/bash-completion/completions/pacmd
sudo rm -f /usr/share/bash-completion/completions/pasuspender

# Clean up pulse configurations
rm -rf ~/.config/pulse ~/.pulse

# Create Neovim configuration symlink
mkdir -p ~/.config/nvim/lua
ln -sf ~/config/nvchad/ ~/.config/nvim/lua/custom

echo "Installation complete! Please reboot your system."

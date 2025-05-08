add stuff here some time idk

# Fonts

A note to myself

- do not ever install nerd-fonts-source-code-pro
  it sucks and messes up font awesome rendering

```sh
git clone https://github.com/shaunsingh/SFMono-Nerd-Font-Ligaturized.git && cd SFMono-Nerd-Font-Ligaturized
cp *.otf ~/.local/share/fonts

```

Or

```sh

yay -S nerd-fonts-sf-mono
yay -S ttf-font-icons
```

Without ligatures

In order for the tmux theme to work you have to have your disired nerd font aswell as
noto-fonts and noto-fonts-emoji on arch can be installed with the following

```sh
sudo pacman -S noto-fonts noto-fonts-emoji
```

update the font cache:

```sh
fc-cache -fv
```

```sh
gsettings set org.gnome.desktop.interface font-name 'SF Mono Nerd Font 11'
gsettings set org.gnome.desktop.interface monospace-font-name 'SF Mono Nerd Font 10'
```

For anyone else who reads this that is not me

- Do not run anything in the scripts folder
  - All of that is for my personal set up
  - Because I am lazy, way to many things are run in root

# Special Notes

```bash
ln -s ~/config/nvchad/ ~/config/.config/nvim/lua/custom
```

# ZSH

Install oh-my-zsh

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

```

In order to get the highlighting and
auto completion for zsh, I use oh-my-zsh plugin manager
however we still need to pull them with the following

```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
```

# Use via

Use via has weird permission error on arch

To fix this add the keyboard to the users group which can be done with the following

```sh
sudo chown $USER:$USER /dev/hidraw3
```

The number at the end of hidraw can be found by going to

```
chrome://device-log/
```

# GTK and theming

```sh
sudo pacman -S kvantum
yay -S full-dracula-theme-git nerd-fonts-sf-mono

# Create GTK configuration directories
mkdir -p ~/.config/gtk-3.0
mkdir -p ~/.config/gtk-4.0

# Set GTK theme
cat > ~/.config/gtk-3.0/settings.ini << EOF
[Settings]
gtk-theme-name=Dracula
gtk-font-name=SF Mono Nerd Font 10
EOF

# Copy settings for GTK4
cp ~/.config/gtk-3.0/settings.ini ~/.config/gtk-4.0/


# Set up Kvantum
mkdir -p ~/.config/Kvantum
echo "theme=Dracula" > ~/.config/Kvantum/kvantum.kvconfig

# Configure Qt5 applications
cat > ~/.config/qt5ct/qt5ct.conf << EOF
[Appearance]
style=kvantum
font="SF Mono Nerd Font,10,-1,5,50,0,0,0,0,0"
EOF

# Set Qt environment variables in ~/.profile
echo "export QT_QPA_PLATFORMTHEME=qt5ct" >> ~/.profile



gsettings set org.gnome.desktop.interface gtk-theme "Dracula"
gsettings set org.gnome.desktop.wm.preferences theme "Dracula"
gsettings set org.gnome.desktop.interface icon-theme "Dracula"

```

# Lightdm

```sh
sudo pacman -S lightdm lightdm-gtk-greeter
# Enable LightDM service
sudo systemctl enable lightdm

# Configure greeter
sudo tee /etc/lightdm/lightdm-gtk-greeter.conf << EOF
[greeter]
theme-name = Dracula
font-name = SF Mono Nerd Font 10
active-monitor = #cursor
EOF
```

```sh
cd sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

```

luarocks
lua51
ripgrep
fd
wget
php
rust
ruby
julia
tree-sitter
eza
zoxide
grim
slurp
yazi
bluetui
impala
pulsemixer
spotify-tui

sudo npm install -g neovim

sudo pacman -S sof-firmware alsa-firmware alsa-utils

if conflicts

```sh
sudo rm /usr/lib/systemd/user/pulseaudio-x11.service
sudo rm /usr/lib/systemd/user/pulseaudio.service
sudo rm /usr/lib/systemd/user/pulseaudio.socket
sudo rm /usr/lib/udev/rules.d/90-pulseaudio.rules
sudo rm /usr/share/bash-completion/completions/pacmd
sudo rm /usr/share/bash-completion/completions/pasuspender
```

```sh
sudo pacman -S pulseaudio pulseaudio-alsa pavucontrol
```

```sh
rm -rf ~/.config/pulse
rm -rf ~/.pulse
```

should probably reboot

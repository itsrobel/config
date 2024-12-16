# Setup Script

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

yay -s nerd-fonts-sf-mono
yay -s ttf-font-icons
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

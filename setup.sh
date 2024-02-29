#!/usr/bin/env

bash $(pwd)/iparu.sh
yes | paru -S $(cat conf/packages.txt | cut -d' ' -f1) --needed

rm -rf ~/.local/share/
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

bash $(pwd)/links.sh
bash $(pwd)/spicetify/spice.sh
bash $(pwd)/sysd.sh

git config --global user.email "itsrobel.schwarz@gmail.com"
git config --global user.name "Robel Schwarz"
git config --global credential.helper store
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
chsh -s $(which fish)

# Neovim things
yes | sudo npm install -g neovim

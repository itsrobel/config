#!/usr/bin/env

bash $(pwd)/iparu.sh
paru -S $(cat conf/packages.txt | cut -d' ' -f1) --needed

bash $(pwd)/links.sh
bash $(pwd)/spicetify/spice.sh
bash $(pwd)/sysd.sh

git config --global user.email "itsrobel.schwarz@gmail.com"
git config --global user.name "Robel Schwarz"
git config --global credential.helper store
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
chsh -s $(which fish)

sudo npm install -g neovim
gem install mdl
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"
gem list
gem update

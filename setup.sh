#!/usr/bin/env

bash $(pwd)/iparu.sh
paru -S $(cat conf/packages.txt | cut -d' ' -f1) --needed

bash $(pwd)/links.sh
bash $(pwd)/spicetify/spice.sh
bash $(pwd)/sysd.sh

git config --global user.email "itsrobel.schwarz@gmail.com" 
git config --global user.name "Robel Schwarz"
git config --global credential.helper store
chsh -s $(which fish)


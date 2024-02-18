#!/usr/bin/env

exal $(pwd)/iparu.sh
paru -S $(cat conf/packages.txt | cut -d' ' -f1) --needed

eval $(pwd)/links.sh
eval $(pwd)/spicetify/spice.sh
eval $(pwd)/sysd.sh

git config --global user.email "itsrobel.schwarz@gmail.com" 
git config --global user.name "Robel Schwarz"
git config --global credential.helper store
chsh -s $(which fish)


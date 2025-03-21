#!/bin/bash

# Alap csomagok telepítése
if [[ "$(command -v apt)" ]]; then
    sudo apt update && sudo apt install -y vim git curl
elif [[ "$(command -v dnf)" ]]; then
    sudo dnf install -y vim git curl
elif [[ "$(command -v pacman)" ]]; then
    sudo pacman -Sy --needed vim git curl
elif [[ "$(command -v zypper)" ]]; then
    sudo zypper refresh && sudo zypper install -y vim git curl
else
    echo "Nem támogatott csomagkezelő!"
    exit 1
fi

# Vim Plug telepítése
mkdir -p ~/.vim/autoload ~/.vim/plugged ~/.vim/undodir ~/.config/db_ui
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Színséma másolása
mkdir -p ~/.vim/colors
cp .vim/colors/* ~/.vim/colors/

# .vimrc beállítása
cp .vimrc ~/.vimrc

# DB UI konfiguráció másolása
cp .config/db_ui/connections.json ~/.config/db_ui/

# Vim pluginok telepítése
vim +PlugInstall +qall

echo "Telepítés kész! Indítsd újra a terminált, és használd a Vim-et!"

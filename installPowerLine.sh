#!/bin/sh

cd ~/dotfiles/.zsh
git clone https://github.com/milkbikis/powerline-shell.git
cd powerline-shell
cp ~/dotfiles/config.py.dist.sample config.py.dist
cp config.py.dist config.py
./install.py

cd ~/dotfiles
sh fontInstaller.sh

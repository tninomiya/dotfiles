#!/bin/sh

cd ~/dotenv/.zsh
git clone https://github.com/milkbikis/powerline-shell.git
cd powerline-shell
cp ~/dotenv/config.py.dist.sample config.py
cp config.py.dit config.py
./install.py

cd ~/dotfiles
sh fontInstaller.sh

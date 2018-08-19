#!/bin/sh
cp -rf ~/dotfiles/.zsh/* ~/
mkdir ~/.config
ln -sf ~/dotfiles/.config/* ~/.config

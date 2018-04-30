#!/bin/sh
cp -rf ~/dotfiles/runcoms ~/.zprezto/runcoms
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
mkdir ~/.config
ln -sf ~/dotfiles/.config/* ~/.config

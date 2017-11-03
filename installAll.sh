#!/bin/sh

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
git clone --recursive https://github.com/sorin-ionescu/prezto.git ~/.zprezto

mkdir origin_conf
mv  .zprofile .zshenv .zshrc origin_conf

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

echo installed
cd ~/dotfiles
sh ./fontInstaller.sh
sh ./dotfilesLink.sh

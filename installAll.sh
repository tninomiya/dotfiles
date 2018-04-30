#!/bin/sh

xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

touch ~/.bash_profile
echo `export PATH=$HOME/.bin:$PATH` >> ~/.bash_profile
echo `export PATH=/usr/local/bin:$PATH` >> ~/.bash_profile
source ~/.bash_profile


brew upgrade
brew install zsh peco neovim tig tmux readline dart python3 tree
git clone --recursive https://github.com/sorin-ionescu/prezto.git ~/.zprezto

mkdir origin_conf
mv  .zprofile .zshenv .zshrc origin_conf

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

cd ~/dotfiles
sh ./fontInstaller.sh
sh ./dotfilesLink.sh

echo installed

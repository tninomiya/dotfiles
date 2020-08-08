#/bin/bash
brew upgrade
brew install git zsh ghq tmux tig vim go peco alacritty starship zsh-syntax-highlighting
brew cask install alacritty
brew tap homebrew/cask-fonts
brew cask install font-roboto-mono-nerd-font
mkdir ~/.zsh
git clone --depth 1 git@github.com:mollifier/anyframe.git ~/.zshrc/

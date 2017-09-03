#!/bin/sh

echo ================================
echo Start Update!!
echo --------------------------------
echo
echo Cloning...
echo
git checkout master
git pull
echo
echo DONE!
echo
echo --------------------------------
echo
echo UPDATE POWERLINE-SHELL
echo
cd ~/dotfiles/.zsh/powerline-shell
git pull
cp ~/dotfiles/config.py.dist.sample config.py.dist
cp config.py.dist config.py
./install.py
echo
echo DONE!
echo
echo --------------------------------
echo
echo UPDATE ZSH & TMUX
echo
sh ~/dotfiles/dotfilesLink.sh
echo
echo DONE!
echo
echo --------------------------------
echo
echo RESULT
echo
echo Update powerline-shell
echo Update zsh
echo Update tmux
echo
echo --------------------------------
echo Success...   _:\(´ཀ\`」 ∠\):_
echo ================================
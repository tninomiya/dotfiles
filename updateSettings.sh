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
echo Update zsh
echo Update tmux
echo
echo --------------------------------
echo Success...   _:\(´ཀ\`」 ∠\):_
echo ================================

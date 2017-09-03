#!/bin/sh
# clone
git clone https://github.com/powerline/fonts.git
# install
cd fonts
sh install.sh "Source Code Powerline Regular"
# clean-up a bit
cd ..
rm -rf fonts

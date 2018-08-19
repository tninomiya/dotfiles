#!/bin/sh
# clone
git clone https://github.com/powerline/fonts.git
# install
cd fonts
sh install.sh
# clean-up a bit
cd ..
rm -rf fonts

ln -svnf ~/dotfiles/config ~/.config
ln -svnf ~/dotfiles/vim ~/.vim
for rcfile in ~/dotfiles/rcs/*; do
  ln -svnf "$rcfile" "${HOME}/.${rcfile:t}"
done
ln -svnf ~/dotfiles/bin ~/.bin

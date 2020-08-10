ln -svnf ~/dotfiles/config ~/.config
ln -svnf ~/dotfiles/vim ~/.vim
for rcfile in ~/dotfiles/rcs/*; do
  ln -svnf "$rcfile" "${HOME}/.${rcfile:t}"
done
ln -svnf ~/dotfiles/bin ~/.bin
ln -svnf /usr/local/share/zsh/site-functions ~/.zsh/completions
ln -s ~/.rustup/toolchains/stable-x86_64-apple-darwin/share/zsh/site-functions/_cargo ~/.zsh/completions

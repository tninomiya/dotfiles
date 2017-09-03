export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PGDATA=/usr/local/var/postgres
export PATH=$PATH:/usr/local/mysql/bin
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=$HOME/dotfiles/.zsh/lib:$PATH
export PATH=$HOME/.bin:$PATH
export PATH=/usr/local/bin:$PATH

if [ -f ~/.zshrc ] ; then
. ~/.zshrc
fi


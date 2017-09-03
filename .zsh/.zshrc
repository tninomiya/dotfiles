autoload -U compinit
compinit
zstyle ':completion:*:default' menu select=2

# alias
alias pgstart='pg_ctl -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl stop'
alias ls='ls -G'
alias ll='ls -la'
alias gf='git-foresta --all --style=10 | less -RSX'

# Powerline
function powerline_precmd() {
  export PS1="$(~/dotfiles/.zsh/powerline-shell/powerline-shell.py $? --shell zsh 2> /dev/null)"
}
function install_powerline_precmd() {
    for s in "${precmd_functions[@]}" ; do
        if [ "$s" = "powerline_precmd" ] ; then
             return
        fi
    done
    precmd_functions+=(powerline_precmd)
}
install_powerline_precmd


if [ -f ~/.launchTmux.sh ] ; then
. ~/.launchTmux.sh
fi

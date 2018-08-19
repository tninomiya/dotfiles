#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

autoload -U compinit
compinit
zstyle ':completion:*:default' menu select=2

# alias
alias ls='ls -G'
alias ll='ls -la'

alias tn='tmux'
alias tls='tmux ls'
alias ta='tmux a'

alias gf='git-foresta --all --style=10 | less -RSX'

alias pgstart='pg_ctl -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl stop'

alias vim='nvim'

autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

fpath=($HOME/.zsh/anyframe(N-/) $fpath)
autoload -Uz anyframe-init
anyframe-init

## よく移動するディレクトリ一覧をインクリメントサーチ & 移動
bindkey '^@' anyframe-widget-cdr
## bash history一覧インクリメントサーチ & 実行
bindkey '^xr' anyframe-widget-execute-history
## branch一覧をインクリメントサーチ & checkout
bindkey '^xb' anyframe-widget-checkout-git-branch
## プロセス一覧をインクリメントサーチ & kill
bindkey '^xk' anyframe-widget-kill
## ghqでcloneしたリポジトリ一覧をインクリメントサーチ
bindkey '^xg' anyframe-widget-cd-ghq-repository

#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
#if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
#fi

# Customize to your needs...

autoload -U compinit
compinit
zstyle ':completion:*:default' menu select=2
setopt nonomatch

# alias
alias ls='ls -G'
alias ll='ls -la'

alias gf='git-foresta --all --style=10 | less -RSX'

alias vim='nvim'
alias cat='lolcat'

autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

fpath=($HOME/.zsh/anyframe(N-/) $fpath)
autoload -Uz anyframe-init
anyframe-init

## よく移動するディレクトリ一覧をインクリメントサーチ & 移動
bindkey '^@' anyframe-widget-cdr
## bash history一覧インクリメントサーチ & 実行
bindkey '^r' anyframe-widget-execute-history
## branch一覧をインクリメントサーチ & checkout
bindkey '^b' anyframe-widget-checkout-git-branch
## プロセス一覧をインクリメントサーチ & kill
bindkey '^xk' anyframe-widget-kill
## ghqでcloneしたリポジトリ一覧をインクリメントサーチ
bindkey '^g' anyframe-widget-cd-ghq-repository

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

export EDITOR=nvim

export TERM=xterm-256color

function peco-ssh () {
  local selected_host=$(awk '
  tolower($1)=="host" {
    for (i=2; i<=NF; i++) {
      if ($i !~ "[*?]") {
        print $i
      }
    }
  }
  ' ~/.ssh/config | sort | peco --query "$LBUFFER")
  if [ -n "$selected_host" ]; then
    BUFFER="ssh ${selected_host}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-ssh
bindkey '^h' peco-ssh

function replace-githooks() {
  if [ -e .git/hooks ]; then
    rm -rf .git/hooks
    ln -s ~/.git_template .git/hooks
  fi
}

source <(kubectl completion zsh)

eval "$(starship init zsh)"

set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
    source ~/.vimrc
let mapleader=","

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

augroup Plugin_Hook
  autocmd!
augroup END

let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:config_home = empty($XDG_CONFIG_HOME) ? expand('~/.config') : $XDG_CONFIG_HOME

let s:dein_path = s:cache_home . '/dein'
let s:dein_repo_path = s:dein_path . '/repos/github.com/Shougo/dein.vim'
let s:toml_path = s:config_home . '/nvim/vimrc.d/dein'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_path)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_path
  endif
  execute 'set runtimepath^=' . s:dein_repo_path
endif

" === Load Dein
if dein#load_state(s:dein_path)
  call dein#begin(s:dein_path)
  call dein#load_toml(s:toml_path . '/plugins.toml', {'lazy': 0})
  call dein#load_toml(s:toml_path . '/plugins-lazy.toml', {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if has('vim_starting') && dein#check_install()
    call dein#install()
endif

let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1
set background=dark
colorscheme hybrid

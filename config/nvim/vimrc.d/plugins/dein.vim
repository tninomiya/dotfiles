"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

augroup Plugin_Hook
  autocmd!
augroup END


let s:dein_path = g:cache_home . '/dein'
let s:dein_repo_path = s:dein_path . '/repos/github.com/Shougo/dein.vim'
let s:toml_path = g:config_home . '/nvim/dein'

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

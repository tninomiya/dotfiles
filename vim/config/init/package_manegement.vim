" vim default
"packloadall                     " Load all plugins.
"silent! helptags ALL            " Load help files for all plugins.

" vim-plugin
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.github.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-vinegar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-unimpaired'
Plug 'jremmen/vim-ripgrep'
Plug 'easymotion/vim-easymotion'
Plug 'powerman/vim-plugin-AnsiEsc'

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'

Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'mattn/webapi-vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'hashivim/vim-terraform' , { 'for': 'terraform'}
Plug 'rust-lang/rust.vim'
Plug 'mattn/vim-goimports'

Plug 'iberianpig/tig-explorer.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'tyru/open-browser.vim'
Plug 'aklt/plantuml-syntax'
Plug 'weirongxu/plantuml-previewer.vim'

Plug 'mattn/vim-maketable'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

syntax on                  " Enable syntax highlighting.
filetype plugin indent on  " Enable file type based indentation.

set number                        " Display column numbers.
" set relativenumber              " Display relative column numbers.

set cursorline " カーソルラインをハイライト


if !isdirectory(expand("$HOME/.vim/swap"))
    call mkdir(expand("$HOME/.vim/swap"), "p")
endif
set directory=$HOME/.vim/swap/ " Set swap directory

set undofile
if !isdirectory(expand("$HOME/.vim/undodir"))
    call mkdir(expand("$HOME/.vim/undodir"), "p")
endif
set undodir=$HOME/.vim/undodir

set foldmethod=indent           " Indentation-based folding.
autocmd BufRead * normal zR

set wildmenu                    " Enable enhanced tab autocomplete.
set wildmode=list:longest,full  " Complete till longest string, then open menu.

set hlsearch                    " Highlight search results.
set incsearch                   " Search as you type.

set clipboard+=unnamed,unnamedplus  " Copy into system (*, +) registers.

syntax on                  " Enable syntax highlighting.
filetype plugin indent on  " Enable file type based indentation.

let mapleader = " "

set number                        " Display column numbers.
" set relativenumber              " Display relative column numbers.

set cursorline " カーソルラインをハイライト

if !isdirectory(expand("$HOME/.vim/swap"))
    call mkdir(expand("$HOME/.vim/swap"), "p")
endif
set directory=$HOME/.vim/swap// " Set swap directory

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

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

"autocmd QuickFixCmdPost *grep* cwindow

""カッコ補完: { ( [
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap () ()
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap [ []<ESC>i
inoremap [<Enter> []<Left><CR><ESC><S-o>

" 行頭と行末に文字列を挿入
" 範囲選択をしていない場合全範囲が対象となる
" ex.) InTH <div> <\/div>
function! s:insert_head_and_tail(...) range
    let head = a:1 " 行頭に入れたい文字列
    let tail = a:2 " 行末に入れたい文字列

    " 範囲選択中かで実行するコマンドが違うので分岐
    if a:firstline == a:lastline
        execute ':%s/^/'.head.'/g | %s/$/'.tail.'/g'
    else
        execute ':'.a:firstline.','.a:lastline.'s/^/'.head.'/g | '.a:firstline.','.a:lastline."s/$/".tail.'/g'
    endif
endfunction
command! -nargs=+ -range InTH <line1>,<line2> call s:insert_head_and_tail(<f-args>)

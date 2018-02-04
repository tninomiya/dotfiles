" reset augroup
augroup MyAutoCmd
    autocmd!
augroup END

let $CACHE = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let $CONFIG = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME
let $DATA = empty($XDG_DATA_HOME) ? expand('$HOME/.local/share') : $XDG_DATA_HOME

set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解決


" tab, indent
set expandtab " タブ入力を複数の空白入力に置き換える
set tabstop=2 " 画面上でタブ文字が占める幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=2 " smartindentで増減する幅


" search
set incsearch " インクリメンタルサーチ. １文字入力毎に検索を行う
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch " 検索結果をハイライト


" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on

" cursor
set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set number " 行番号を表示
set cursorline " カーソルラインをハイライト

" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

" バックスペースキーの有効化
set backspace=indent,eol,start

set clipboard=unnamed

" {{{ dein
let s:dein_dir = expand('$DATA/dein')

if &runtimepath !~# '/dein.vim'
    let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

    " Auto Download
    if !isdirectory(s:dein_repo_dir)
        call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
    endif

    execute 'set runtimepath^=' . s:dein_repo_dir
endif


" dein.vim settings

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    let s:toml_dir = expand('$CONFIG/dein')

    call dein#load_toml(s:toml_dir . '/plugins.toml', {'lazy': 0})
    call dein#load_toml(s:toml_dir . '/lazy.toml', {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
    call dein#install()
endif
call deoplete#enable()
" }}}

" vim-go
autocmd BufNewFile,BufRead *.go set filetype=go
autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4
"" mapping
""" go runのキーマッピング
au FileType go nmap gr (go-run)
""" go testのキーマッピング
au FileType go nmap gt (go-test)
"" highlight
let g:go_hightlight_functions = 1
let g:go_hightlight_methods = 1
let g:go_hightlight_structs = 1
let g:go_hightlight_interfaces = 1
let g:go_hightlight_operators = 1
let g:go_hightlight_build_constraints = 1
"" GoFmt時にインポートするパッケージを整理(GoFmtはファイル書き込み時に自動的に実行される)
let g:go_fmt_command = "goimports"


set background=dark
colorscheme hybrid

let g:airline_theme='powerlineish'
set laststatus=2
set t_Co=256
let g:lightline = { 
     \ 'active': {
     \   'left': [ [ 'mode', 'paste' ],
     \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ] 
     \ },
     \ 'component': {
     \   'readonly': '%{&filetype=="help"?"":&readonly?"✖︎":""}',
     \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
     \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
     \ },
     \ 'component_visible_condition': {
     \   'readonly': '(&filetype!="help"&& &readonly)',
     \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
     \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
     \ }
     \ }

inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<Left>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap [ []<Left>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap < <><Left>
inoremap <<Enter> <><Left><CR><ESC><S-o>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ` ``<Left>

nnoremap <silent><C-e> :NERDTreeToggle<CR>

autocmd FileType go :highlight goErr cterm=bold ctermfg=214
autocmd FileType go :match goErr /\<err\>/
set completeopt=menu,preview

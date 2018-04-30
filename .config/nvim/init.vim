" reset augroup
augroup MyAutoCmd
    autocmd!
augroup END

let g:nvim_dir = expand('~/.config/nvim')
let g:rc_dir = expand(g:nvim_dir . '/' . 'rc')

" rcファイル読み込み関数
function! s:source_rc(rc_file_name)
    let rc_file = expand(g:rc_dir . '/' . a:rc_file_name)
    if filereadable(rc_file)
        execute 'source' rc_file
    endif
endfunction

"------------------------------------------------------------------------------

" ===GENERAL===
" 基本
call s:source_rc('general/init.rc.vim')

" エディタ
call s:source_rc('general/editor.rc.vim')

" カラースキーマ
call s:source_rc('general/colorscheme.rc.vim')

" ===PLUGIN===
" Dein.vim
call s:source_rc('plugin/dein.rc.vim')

" LightLine.vim
call s:source_rc('plugin/lightline.rc.vim')

" NERDTree.vim
call s:source_rc('plugin/nerdtree.rc.vim')

" vim-fugitive.vim
call s:source_rc('plugin/vim-fugitive.rc.vim')

" ===LANGUAGE===
" Go
call s:source_rc('lang/go.rc.vim')

" javascript
call s:source_rc('lang/js.rc.vim')

" markdown
call s:source_rc('lang/md.rc.vim')



let g:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let g:config_home = empty($XDG_CONFIG_HOME) ? expand('~/.config') : $XDG_CONFIG_HOME

let s:nvim_dir = g:config_home . '/nvim'
let s:rc_dir = expand(s:nvim_dir . '/vimrc.d')
function! s:source_rc(rc_file_name)
    let rc_file = expand(s:rc_dir . '/' . a:rc_file_name)
    if filereadable(rc_file)
        execute 'source' rc_file
    endif
endfunction

call s:source_rc('editor.vim')
call s:source_rc('color.vim')
call s:source_rc('navigate.vim')

call s:source_rc('plugins/dein.vim')
call s:source_rc('plugins/defx.vim')
call s:source_rc('plugins/fzf.vim')


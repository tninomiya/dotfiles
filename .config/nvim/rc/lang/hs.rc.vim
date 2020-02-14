autocmd BufNewFile,BufRead *.hs set filetype=haskell
autocmd FileType haskell setlocal expandtab tabstop=4 shiftwidth=4
let g:LanguageClient_rootMakers = {
  \ 'haskell': ['*.cabal', 'stack.yaml'],
  \ } 
let g:LanguageClient_serverCommands = {
  \ 'haskell': ['hie-wrapper'],
  \ }

" LanguageClientの機能のショートカットを登録
function LC_maps()
  if has_key(g:LanguageClient_serverCommands, &filetype)
    nnoremap <silent> <C-h> :call LanguageClient_contextMenu()<CR>
    map <silent> <Leader>lt :call LanguageClient#textDocument_hover()<CR>
    map <silent> <Leader>lg :call LanguageClient#textDocument_definition()<CR>
    map <silent> <Leader>lr :call LanguageClient#textDocument_rename()<CR>
    map <silent> <Leader>lf :call LanguageClient#textDocument_formatting()<CR>
    map <silent> <Leader>lb :call LanguageClient#textDocument_references()<CR>
    map <silent> <Leader>la :call LanguageClient#textDocument_codeAction()<CR>
    map <silent> <Leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>
  endif
endfunction

augroup LanguageClientKeyconfig
  autocmd!
  autocmd Filetype * call LC_maps()
augroup END

hi link ALEError Error
hi Warning term=underline cterm=underline ctermfg=Yellow gui=undercurl guisp=Gold
hi link ALEWarning Warning
hi link ALEInfo SpellCap

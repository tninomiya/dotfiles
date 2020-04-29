let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_float_cursor = 1
let g:asyncomplete_auto_popup = 1

"let g:lsp_signs_enabled = 1         " enable signs

autocmd BufWritePre <buffer> LspDocumentFormatSync
"autocmd BufWritePost <buffer> LspDocumentDiagnostics

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> grn <plug>(lsp-rename)
    nmap <buffer> K <plug>(lsp-hover)
    nmap <buffer> g] <plug>(lsp-next-diagnostic)
    nmap <buffer> g[ <plug>(lsp-previous-diagnostic)
    nmap <buffer> l<Space> <plug>(lsp-document-diagnostics)
        " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

if executable('gopls')
  augroup LspGo
    au!
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'go-lang',
        \ 'cmd': {server_info->['gopls']},
        \ 'whitelist': ['go'],
        \ 'workspace_config': {'gopls': {
        \     'staticcheck': v:true,
        \     'completeUnimported': v:true,
        \     'caseSensitiveCompletion': v:true,
        \     'usePlaceholders': v:true,
        \     'completionDocumentation': v:true,
        \     'watchFileChanges': v:true,
        \     'hoverKind': 'SingleLine',
        \   }},
        \ })
    autocmd FileType go setlocal omnifunc=lsp#complete
  augroup END
endif

if executable('terraform-lsp')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'terraform-lsp',
    \ 'cmd': {server_info->['terraform-lsp']},
    \ 'whitelist': ['terraform','tf'],
    \ })
endif

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
imap <c-space> <Plug>(asyncomplete_force_refresh)
set completeopt+=preview
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

autocmd BufNewFile,BufRead *.md setfiletype markdown

autocmd FileType markdown setlocal tabstop=4 softtabstop=4 shiftwidth=4
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_folding_disabled = 1

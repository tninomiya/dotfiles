autocmd BufNewFile,BufRead *.js setfiletype javascript
autocmd BufNewFile,BufRead *.jsx setfiletype javascript.jsx
autocmd BufNewFile,BufRead *.vue setfiletype vue

autocmd FileType vue syntax sync fromstart

autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2

function! EnableJavascript()
  " Setup used libraries
  let g:used_javascript_libs = 'jquery,vue,react,flux'
  let b:javascript_lib_use_jquery = 1
  let b:javascript_lib_use_vue = 1
  let b:javascript_lib_use_jquery = 1
  let b:javascript_lib_use_react = 1
  let b:javascript_lib_use_flux = 1
endfunction
autocmd MyAutoCmd FileType javascript,javascript.jsx call EnableJavascript()

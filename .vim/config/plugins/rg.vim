" ripgrep recursively searches directories for a regex pattern
" https://github.com/BurntSushi/ripgrep

if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

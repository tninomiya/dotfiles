require('plugins')
require('colorscheme')

vim.cmd[[autocmd BufWritePost plugins.lua PackerCompile]]

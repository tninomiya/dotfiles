require('editor')
require('navigate')
require('plugins')
require('terminal')
require('plug.lsp')
require('lang')

vim.cmd('autocmd BufWritePost plugins.lua PackerCompile')

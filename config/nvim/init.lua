require('editor')
require('navigate')
require('plugins')
require('terminal')
require('lsp')

vim.cmd('autocmd BufWritePost plugins.lua PackerCompile')

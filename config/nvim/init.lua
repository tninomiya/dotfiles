require('editor')
require('navigate')
require('plugins')

vim.cmd[[autocmd BufWritePost plugins.lua PackerCompile]]

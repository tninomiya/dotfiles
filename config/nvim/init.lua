require('editor')
require('navigate')
require('plugins')
require('terminal')

vim.cmd[[autocmd BufWritePost plugins.lua PackerCompile]]

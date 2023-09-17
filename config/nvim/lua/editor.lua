local util = require('util')

local indent = 2
util.opt('b', 'expandtab', true)
util.opt('b', 'shiftwidth', indent)
util.opt('b', 'tabstop', indent)
util.opt('b', 'softtabstop', indent)
util.opt('w', 'number', true)
util.opt('o', 'hidden', true)
util.opt('o', 'title', true)
util.opt('o', 'updatetime', 100)
util.opt('o', 'autoindent', true)
util.opt('o', 'smartindent', true)
util.opt('w', 'cursorline', true)
util.opt('g', 'ignorecase', true)
util.opt('g', 'smartcase', true)

util.bind('g', 'mapleader', ',')

vim.opt.clipboard:append({'unnamed','unnamedplus'})

util.map('n', 'd', 'h') 
util.map('n', 'h', 'j') 
util.map('n', 't', 'k') 
util.map('n', 'n', 'l') 

util.map('v', 'd', 'h') 
util.map('v', 'h', 'j') 
util.map('v', 't', 'k') 
util.map('v', 'n', 'l') 

util.map('n', 'e', 'd') 
util.map('n', 'ee', 'dd') 
util.map('v', 'e', 'd') 
util.map('v', 'ee', 'dd') 

util.map('n', 'r', 'n') 
util.map('v', 'r', 'n') 

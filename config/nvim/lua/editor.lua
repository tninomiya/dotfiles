local util = require('util')

local indent = 2
util.opt('b', 'expandtab', true)
util.opt('b', 'shiftwidth', indent)
util.opt('b', 'tabstop', indent)
util.opt('w', 'number', true)
util.opt('o', 'hidden', true)
util.opt('o', 'title', true)
util.opt('o', 'updatetime', 100)
util.opt('o', 'clipboard', 'unnamed,unnamedplus')
util.bind('g', 'mapleader', ',')

-- let mapleader = ","
-- set number
-- set clipboard+=unnamed,unnamedplus
-- 
-- set autoindent
-- set smartindent
-- set expandtab
-- set tabstop=4
-- set softtabstop=4
-- set shiftwidth=4
-- set backspace=2


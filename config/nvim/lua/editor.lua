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
util.opt('o', 'clipboard', 'unnamed,unnamedplus')
util.opt('o', 'autoindent', true)
util.opt('o', 'smartindent', true)
util.opt('w', 'cursorline', true)

util.bind('g', 'mapleader', ',')


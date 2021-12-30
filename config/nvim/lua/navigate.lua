local util = require('util')
-- Navigate windows with <Ctrl-hjkl> instead of <Ctrl-w> followed by hjkl.
util.map('n', '<c-h>', '<c-w><c-h>')
util.map('n', '<c-j>', '<c-w><c-j>')
util.map('n', '<c-k>', '<c-w><c-k>')
util.map('n', '<c-l>', '<c-w><c-l>')

-- 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
util.map('n', 'j', 'gj')
util.map('n', 'k', 'gk')
util.map('n', '<down>', 'gj')
util.map('n', '<up>', 'gk')

-- カーソルの左右移動で行末から次の行の行頭への移動が可能になる
util.opt('o', 'whichwrap', 'b,s,h,l,<,>,[,],~') 

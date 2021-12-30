local util = require('util')
local opts = { noremap = true, silent = true }

-- Move to previous/next
util.map('n', '<leader>b.', ':BufferPrevious<CR>', opts)
util.map('n', '<leader>b,', ':BufferNext<CR>', opts)
-- Close buffer
util.map('n', '<leader>bc', ':BufferClose<CR>', opts)
-- Wipeout buffer
util.map('n', '<leader>bw', ':BufferWipeout<CR>', opts)
--                 :BufferWipeout<CR>
-- Close commands
util.map('n', '<leader>bo', ':BufferCloseAllButCurrent<CR>', opts)
-- Magic buffer-picking mode
util.map('n', '<leader>bb', ':BufferPick<CR>', opts)
-- Sort automatically by...
util.map('n', '<Space>bb', ':BufferOrderByBufferNumber<CR>', opts)
util.map('n', '<Space>bd', ':BufferOrderByDirectory<CR>', opts)
util.map('n', '<Space>bl', ':BufferOrderByLanguage<CR>', opts)

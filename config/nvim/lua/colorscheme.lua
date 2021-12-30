-- https://github.com/shaunsingh/nord.nvim
-- vim.g.nord_contrast = true
-- vim.g.nord_borders = false
-- vim.g.nord_disable_background = false
-- vim.g.nord_italic = true

-- Load the colorscheme
-- require('nord').set()


-- https://github.com/edeneast/nightfox.nvim
local nightfox = require('nightfox')
nightfox.setup({
  fox = "nordfox", -- change the colorscheme to use nordfox
  transparent = true, -- Disable setting the background color
  styles = {
    comments = "italic", -- change style of comments to be italic
    keywords = "NONE", -- change style of keywords to be bold
    functions = "NONE" -- styles can be a comma separated list
  },
  inverse = {
    match_paren = true, -- Enable/Disable inverse highlighting for match parens
    visual = true, -- Enable/Disable inverse highlighting for visual selection
    search = true, -- Enable/Disable inverse highlights for search highlights
  }
})
-- Load the configuration set above and apply the colorscheme
nightfox.load()


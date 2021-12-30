vim.cmd[[packadd packer.nvim]]

require'packer'.startup(function()
  use {
    'wbthomason/packer.nvim',
    opt = true
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    config = 'require"treesitter"',
    run = ':TSUpdate'
  }

  use {'shaunsingh/nord.nvim'}
  use {
    'EdenEast/nightfox.nvim',
    config = 'require"colorscheme"'
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    config = 'require"filetree"'
  }

  use {
    'nvim-lualine/lualine.nvim',
    config = 'require"nvim-lualine"',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  use {
    'romgrk/barbar.nvim',
    config = 'require"barbar-nvim"',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  use {
    'nvim-telescope/telescope.nvim',
    config = 'require"telescope-conf"',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

end)

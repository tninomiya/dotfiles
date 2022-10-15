vim.cmd[[packadd packer.nvim]]

require'packer'.startup(function()
  use {
    'wbthomason/packer.nvim',
    opt = true
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    config = 'require("plug.treesitter")',
    run = ':TSUpdate'
  }

  use {'shaunsingh/nord.nvim'}
  use {
    'EdenEast/nightfox.nvim',
    config = 'require("plug.colorscheme")'
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    config = 'require("plug.nvim-tree")'
  }

  use {
    'nvim-lualine/lualine.nvim',
    config = 'require("plug.lualine")',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  use {
    'romgrk/barbar.nvim',
    config = 'require("plug.barbar")',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  use {
    'nvim-telescope/telescope.nvim',
    config = 'require("plug.telescope")',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Better sorting performance
  -- https://github.com/nvim-telescope/telescope.nvim/wiki/Extensions
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use {'neovim/nvim-lspconfig'}
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  use {'hrsh7th/nvim-cmp'}
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/cmp-vsnip'}
  use {'hrsh7th/cmp-buffer'}

  use {
    'hrsh7th/vim-vsnip-integ',
    requires = {'hrsh7th/vim-vsnip'}
  }

  use {
    "ray-x/lsp_signature.nvim",
  }

  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = 'require("plug.formatter")',
    requires = { "nvim-lua/plenary.nvim" }
  }

  use {
    "folke/trouble.nvim",
    config = 'require("plug.trouble")',
    requires = "kyazdani42/nvim-web-devicons",
  }

  use {
    'sakhnik/nvim-gdb',
    run = ':!./install.sh'
  }

end)

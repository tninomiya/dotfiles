require("lazy").setup({
	{
		"shaunsingh/nord.nvim",
		-- https://github.com/folke/lazy.nvim#examples
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme nord]])
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		--     build = ':TSUpdate',
		config = function()
			require("plug.treesitter")
		end,
	},
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			require("plug.nvim-tree")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plug.lualine")
		end,
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		},
	},
	{
		"romgrk/barbar.nvim",
		config = function()
			require("plug.barbar")
		end,
		dependencies = { "kyazdani42/nvim-web-devicons" },
	},
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			require("plug.telescope")
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	--   -- Better sorting performance
	--   -- https://github.com/nvim-telescope/telescope.nvim/wiki/Extensions

	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},

	{ "neovim/nvim-lspconfig" },
	{ "williamboman/mason.nvim" },
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("plug.lsp")
		end,
	},

	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("plug.formatter")
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{
		"mattn/efm-langserver",
		config = function()
			require("plug/efm")
		end,
	},

	{ "hrsh7th/nvim-cmp" },
	-- cmp sources
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-vsnip" },
	{ "hrsh7th/cmp-buffer" },

	{
		"hrsh7th/vim-vsnip-integ",
		dependencies = { "hrsh7th/vim-vsnip" },
	},

	"ray-x/lsp_signature.nvim",
	{
		"folke/trouble.nvim",
		config = function()
			require("plug.trouble")
		end,
		dependencies = "kyazdani42/nvim-web-devicons",
	},

	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},

	{
		"mattn/vim-maketable",
	},

	{
		"tpope/vim-fugitive",
	},

	{
		"knsh14/vim-github-link",
	},
})

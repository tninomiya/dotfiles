-- https://github.com/kyazdani42/nvim-tree.lua
local util = require("util")
util.map("n", "<leader>e", ":NvimTreeToggle<CR>", {})

local function on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- Default mappings not inserted as:
	--  remove_keymaps = true
	--  OR
	--  view.mappings.custom_only = true

	-- Mappings migrated from view.mappings.list
	--
	-- You will need to insert "your code goes here" for any mappings with a custom action_cb
	vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", ".", api.tree.change_root_to_node, opts("CD"))
	vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
	vim.keymap.set("n", "<C-x>", api.node.open.horizontal, opts("Open: Horizontal Split"))
	vim.keymap.set("n", "<C-t>", api.node.open.tab, opts("Open: New Tab"))
	vim.keymap.set("n", "<", api.node.navigate.sibling.prev, opts("Previous Sibling"))
	vim.keymap.set("n", ">", api.node.navigate.sibling.next, opts("Next Sibling"))
	vim.keymap.set("n", "P", api.node.navigate.parent, opts("Parent Directory"))
	vim.keymap.set("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
	vim.keymap.set("n", "<Tab>", api.node.open.preview, opts("Open Preview"))
	vim.keymap.set("n", "K", api.node.navigate.sibling.first, opts("First Sibling"))
	vim.keymap.set("n", "J", api.node.navigate.sibling.last, opts("Last Sibling"))
	vim.keymap.set("n", "H", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
	vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
	vim.keymap.set("n", "a", api.fs.create, opts("Create"))
	vim.keymap.set("n", "e", api.fs.remove, opts("Delete"))
	vim.keymap.set("n", "E", api.fs.trash, opts("Trash"))
	vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
	vim.keymap.set("n", "<C-r>", api.fs.rename_sub, opts("Rename: Omit Filename"))
	vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
	vim.keymap.set("n", "c", api.fs.copy.node, opts("Copy"))
	vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
	vim.keymap.set("n", "y", api.fs.copy.filename, opts("Copy Name"))
	vim.keymap.set("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))
	vim.keymap.set("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
	vim.keymap.set("n", "[c", api.node.navigate.git.prev, opts("Prev Git"))
	vim.keymap.set("n", "]c", api.node.navigate.git.next, opts("Next Git"))
	vim.keymap.set("n", "-", api.tree.change_root_to_parent, opts("Up"))
	vim.keymap.set("n", "x", api.node.run.system, opts("Run System"))
	vim.keymap.set("n", "q", api.tree.close, opts("Close"))
	vim.keymap.set("n", "g?", api.tree.toggle_help, opts("Help"))
end

vim.cmd([[
" auto close
" https://github.com/kyazdani42/nvim-tree.lua#tips--reminders
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])

-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require("nvim-tree").setup({
	on_attach = on_attach,
	disable_netrw = true,
	hijack_netrw = true,
	open_on_tab = false,
	hijack_cursor = true,
	update_cwd = true,
	respect_buf_cwd = true,
	actions = {
		change_dir = {
			enable = true,
		},
		open_file = {
			quit_on_open = true,
		},
	},
	diagnostics = {
		enable = false,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	system_open = {
		cmd = nil,
		args = {},
	},
	filters = {
		dotfiles = false,
		custom = {},
	},
	git = {
		enable = true,
		ignore = false,
		timeout = 500,
	},
	view = {
		width = 30,
		hide_root_folder = false,
		side = "left",
		number = false,
		relativenumber = false,
		signcolumn = "yes",
	},
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
	renderer = {
		add_trailing = true,
		highlight_opened_files = "name",
		group_empty = true,
	},
})

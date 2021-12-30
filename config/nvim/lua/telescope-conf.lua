local vim = vim

local actions = require'telescope.actions'

require'telescope.init'.setup{ defaults = {
    prompt_prefix = "🔍",
    mappings = {
      i = {
        --["<c-c>"] = false,
        ["<c-x>"] = actions.select_horizontal,
        ["<c-v>"] = actions.select_vertical
      },
      n = {
        --["<c-[>"] = actions.close,
        --["<c-c>"] = false,
        ["<c-x>"] = actions.select_horizontal,
        ["<c-v>"] = actions.select_vertical
      }
    }
 }
}

local util = require('util')
local opts = { noremap=true, silent=true }
local keymap_telescope_func = {
  [" F"] = "require'telescope.builtin'.find_files()",
  [" f"] = "require'telescope.builtin'.git_files()",
  [" g"] = "require'telescope.builtin'.grep_string()",
  [" l"] = "require'telescope.builtin'.live_grep()",
  [" ch"] = "require'telescope.builtin'.command_history{}",
  [" h"] = "require'telescope.builtin'.help_tags()",
  [" b"] = "require'telescope.builtin'.buffers{show_all_buffers = true}",
  [" s"] = "require'telescope.builtin'.lsp_document_symbols()",
  [" r"] = "require'telescope.builtin'.lsp_references()",
  [" o"] = "require'telescope.builtin'.oldfiles()",
  ["<leader>gs"] = "require'telescope.builtin'.git_status()",
  ["<leader>gb"] = "require'telescope.builtin'.git_branches()",
  ["<leader>gc"] = "require'telescope.builtin'.git_commits()",
}
for k, v in pairs(keymap_telescope_func) do
  util.map('n', k, string.format("<cmd> lua %s<CR>", v), opts)
end

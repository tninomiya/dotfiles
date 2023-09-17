require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash",
    "dockerfile",
    "go",
    "comment",
    "cpp",
    "elm",
    "hcl",
    "html",
    "http",
    "java",
    "javascript",
    "json",
    "json5",
    "kotlin",
    "lua",
    "make",
    "markdown",
    "proto",
    "python",
    "query",
    "regex",
    "ruby",
    "sparql",
    "terraform",
    "toml",
    "vim",
    "yaml",
  },
    highlight = { enable = true },
  sync_install = false,
  indent = { enable = true },
  auto_install = false,

}

-- https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts
local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            -- apply whatever logic you want (in this example, we'll only use null-ls)
            return client.name == "null-ls"
        end,
        bufnr = bufnr,
    })
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                lsp_formatting(bufnr)
            end,
        })
    end
end
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")
null_ls.setup {
  sources = {
    null_ls.builtins.formatting.prettier.with({
      filetypes = { "html", "json", "markdown" },
      extra_args = {
        "--tab-width", 2,
        "--use-tabs", "false",
      },
    }),
    null_ls.builtins.formatting.fixjson,
    null_ls.builtins.formatting.goimports,
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Source-specific-Configuration#rustfmt
    null_ls.builtins.formatting.rustfmt.with({
      extra_args = function(params)
        local Path = require("plenary.path")
        local cargo_toml = Path:new(params.root .. "/" .. "Cargo.toml")

        if cargo_toml:exists() and cargo_toml:is_file() then
          for _, line in ipairs(cargo_toml:readlines()) do
            local edition = line:match([[^edition%s*=%s*%"(%d+)%"]])
            if edition then
              return { "--edition=" .. edition }
            end
          end
        end
        -- default edition when we don't find `Cargo.toml` or the `edition` in it.
        return { "--edition=2021" }
      end,
    }),
    null_ls.builtins.formatting.terraform_fmt,
    null_ls.builtins.formatting.taplo
  },

  on_attach = on_attach,
}

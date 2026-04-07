vim.lsp.config("ts_ls", {})
vim.lsp.enable "ts_ls"

vim.lsp.config("ruff", {
  init_options = {
    settings = {
      args = {},
    },
  },
})
vim.lsp.enable "ruff"

-- ty: Astral's type checker (replaces pyright + mypy)
-- Install: uv tool install ty@latest
vim.lsp.config("ty", {})
vim.lsp.enable "ty"

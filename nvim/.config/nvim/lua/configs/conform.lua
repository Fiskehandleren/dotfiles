local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  format_on_save = {
    -- One budget shared by every formatter in the chain (three ruff calls for
    -- Python), and it also absorbs the event loop being busy with LSP traffic.
    timeout_ms = 2000,
    lsp_fallback = true,
  },
}

return options

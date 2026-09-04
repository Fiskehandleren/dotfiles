require "nvchad.autocmds"

-- Dim git blame virtual text
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { fg = "#888899", italic = true })
  end,
})
vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { fg = "#888899", italic = true })

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank { timeout = 200 }
  end,
})

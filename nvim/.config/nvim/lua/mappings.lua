require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Telescope with hidden files
map("n", "<leader>ff", function()
  require("telescope.builtin").find_files {
    hidden = true,
    no_ignore = true,
    file_ignore_patterns = { "node_modules/", "venv/", ".venv/", "__pycache__/", ".git/" },
  }
end, { desc = "Find files (incl. dotfiles)" })

-- LSP
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP code action" })

-- Centered search navigation
map("n", "n", "nzzzv", { desc = "Next search result centered" })
map("n", "N", "Nzzzv", { desc = "Prev search result centered" })

-- Debug (nvim-dap)
map("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "Debug toggle breakpoint" })
map("n", "<leader>dc", function()
  require("dap").continue()
end, { desc = "Debug start/continue" })
map("n", "<leader>do", function()
  require("dap").step_over()
end, { desc = "Debug step over" })
map("n", "<leader>di", function()
  require("dap").step_into()
end, { desc = "Debug step into" })
map("n", "<leader>dO", function()
  require("dap").step_out()
end, { desc = "Debug step out" })
map("n", "<leader>dt", function()
  require("dap").terminate()
end, { desc = "Debug terminate" })
map("n", "<leader>du", function()
  require("dapui").toggle()
end, { desc = "Debug toggle UI" })
map("n", "<leader>fr", "<cmd> Telescope lsp_references <CR>", { desc = "LSP references" })

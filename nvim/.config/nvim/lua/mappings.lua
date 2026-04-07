require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>fn", function()
  require("telescope.builtin").find_files { cwd = vim.fn.stdpath "config" }
end, { desc = "[F]ind [N]eovim files" })

map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- Debugging
map("n", "<leader>dpr", function()
  require("dap-python").test_method()
end, { desc = "[D]ebug [P]ython [R]un" })

map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Debug Breakpoint" })
map("n", "<F5>", function()
  require("dap").continue()
end)
map("n", "<F10>", function()
  require("dap").step_over()
end)
map("n", "<F11>", function()
  require("dap").step_into()
end)
map("n", "<F12>", function()
  require("dap").step_out()
end)

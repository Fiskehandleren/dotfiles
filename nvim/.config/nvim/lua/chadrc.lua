-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "catppuccin",
  transparency = true,

	-- base46 uses grey_fg (#4e4d5d) for comments, which disappears against a
	-- transparent background. #7f849c is Catppuccin Mocha's overlay1.
	hl_override = {
		Comment = { fg = "#7f849c" },
		["@comment"] = { fg = "#7f849c" },
	},
}

M.mason = {
  pkgs = {
    "rust-analyzer",
    "pyright",
    "ruff",
    "mypy",
    "debugpy",
    "lua-language-server",
    "delve",
    "ty",
    "pyrefly",
    -- nvim-treesitter (main) compiles parsers with the tree-sitter CLI
    "tree-sitter-cli",
  }
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

return M

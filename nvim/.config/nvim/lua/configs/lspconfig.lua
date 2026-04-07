require("nvchad.configs.lspconfig").defaults()

vim.lsp.config("ty", {
  settings = {
    ty = {
      configuration = {
        rules = {
          ["unresolved-reference"] = "warn",
        },
      },
      inlayHints = {
        variableTypes = true,
        callArgumentNames = true,
        returnTypes = true,
      },
    },
  },
})

vim.lsp.inlay_hint.enable(true)

local servers = { "html", "cssls", "ruff", "ty", "ts_ls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers

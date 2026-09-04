-- NvChad's defaults() already:
--   * applies capabilities + on_init to every server via vim.lsp.config("*")
--   * registers the LSP keymaps through an LspAttach autocmd
--   * configures and enables lua_ls
require("nvchad.configs.lspconfig").defaults()

-- Python ---------------------------------------------------------------------

-- ty: diagnostics, navigation, hover, completion and inlay hints.
vim.lsp.config("ty", {
  settings = {
    ty = {
      diagnosticMode = "workspace",
      completions = {
        autoImport = true,
      },
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

-- Not enabled. ty is the only Python server; formatting on save goes through
-- conform.nvim with the ruff CLI. Add any of these to `servers` to swap them in.

-- ruff as a language server: lint diagnostics, code actions, import organizing.
vim.lsp.config("ruff", {
  on_attach = function(client, _)
    client.server_capabilities.documentFormattingProvider = true
  end,
  settings = {
    ruff = {
      lint = {
        run = "onSave",
      },
      organizeImports = true,
      fixAll = true,
      codeAction = {
        fixViolation = { enable = true },
        disableRuleComment = { enable = true },
      },
    },
  },
})

-- basedpyright, tuned to sit alongside ty: navigation and completion only,
-- type checking off and diagnostics dropped.
vim.lsp.config("basedpyright", {
  settings = {
    basedpyright = {
      disableOrganizeImports = true,
      analysis = {
        typeCheckingMode = "off",
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
        autoImportCompletions = true,
        inlayHints = {
          variableTypes = false,
          callArgumentNames = false,
          functionReturnTypes = false,
          genericTypes = false,
        },
      },
    },
  },
  handlers = {
    ["textDocument/publishDiagnostics"] = function() end,
  },
})

vim.lsp.config("pyrefly", {
  settings = {
    editor = {
      inlayHints = {
        enabled = true,
      },
    },
  },
})

vim.lsp.config("pyright", {
  settings = {
    pyright = {
      -- ruff organizes imports
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        -- ruff lints; pyright only provides navigation and completion
        ignore = { "*" },
      },
    },
  },
})

-- Go -------------------------------------------------------------------------

vim.lsp.config("gopls", {
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
})

-- Rust -----------------------------------------------------------------------
-- rust_analyzer uses nvim-lspconfig's defaults, which detect the workspace
-- root through cargo metadata. Nothing to override.

vim.lsp.inlay_hint.enable(true)

local servers = {
  -- web
  "html",
  "cssls",
  "ts_ls",
  -- sql
  "sqlls",
  -- python
  "ty",
  -- go
  "gopls",
  -- rust
  "rust_analyzer",
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers

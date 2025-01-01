-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
local util = require "lspconfig/util"

local lspconfig = require "lspconfig"
local servers = { "html", "cssls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- -- typescript
-- lspconfig.tsserver.setup {
--   on_attach = on_attach,
--   on_init = on_init,
--   capabilities = capabilities,
-- }

-- golang
lspconfig.gopls.setup {
  on_attach = function(client, bufnr)
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      ["ui.inlayhint.hints"] = {
        -- https://github.com/golang/tools/blob/master/gopls/doc/inlayHints.md
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
}

-- rust
-- lspconfig.rust_analyzer.setup {
--   on_attach = function(client, bufnr)
--     vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
--   end,
--   on_init = on_init,
--   capabilities = capabilities,
--   filetypes = { "rust" },
--   settings = {
--     ["rust-analyzer"] = {
--       cargo = {
--         allFeatures = true,
--       },
--       diagnostics = {
--         enable = true,
--       },
--       completion = {
--         limit = 10,
--       },
--     },
--   },
-- }

-- python
lspconfig.pyright.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { "python" },
}

-- c++
lspconfig.clangd.setup {
  on_attach = on_attach,
  -- on_attach = function(client, bufnr)
  --   client.server_capabilities.signatureHelpProvider = false
  --   on_attach(client, bufnr)
  -- end,
  on_init = on_init,
  capabilities = capabilities,
}

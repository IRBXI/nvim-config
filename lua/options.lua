require "nvchad.options"

-- add yours here!

local o = vim.o
o.tabstop = 4
o.shiftwidth = 4

vim.g.rustaceanvim = {
  server = {
    on_attach = function(client, bufnr)
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })

      -- Set keybindings, etc. here.
    end,
    default_settings = {
      -- rust-analyzer language server configuration
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
        },
        diagnostics = {
          enable = true,
        },
        completion = {
          limit = 10,
        },
      },
    },
  },
}

-- o.cursorlineopt ='both' -- to enable cursorline!

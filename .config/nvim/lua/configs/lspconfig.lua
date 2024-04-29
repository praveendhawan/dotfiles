-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

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

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- local solargraph_path = vim.fn.system("asdf which solargraph")

-- Ruby Server
local server_options = {
  cmd = {
    "asdf",
    "exec",
    "solargraph",
    "stdio"
  },
  capabilities = capabilities,
  on_init = on_init,
  flags = {
    debounce_text_changes = 150,
  },
  init_options = {
    formatting = false
  },
  on_attach = on_attach,
  settings = {
    solargraph = {
      autoformat = false,
      checkGemVersion = true,
      completion = true,
      definitions = true,
      diagnostics = true,
      folding = false,
      formatting = false,
      hover = true,
      logLevel = 'warn',
      references = true,
      rename = true,
      symbols = true,
      transport = 'stdio',
      useBundler = false
    }
  }
}

lspconfig.solargraph.setup(server_options)

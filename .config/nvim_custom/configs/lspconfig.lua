local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- 
-- lspconfig.pyright.setup { blabla}
-- Ruby Server

local server_options = {
  capabilities = capabilities,
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

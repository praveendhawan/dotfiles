require'snippets'.use_suggested_mappings()

local nvim_lsp = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true;

nvim_lsp.solargraph.setup {
  capabilities = capabilities;
  on_attach = on_attach,
}

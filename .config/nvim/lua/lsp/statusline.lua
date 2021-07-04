local lsp_status = require('lsp-status')
local lspconfig = require('lspconfig')

lsp_status.register_progress()

lsp_status.config({
  indicator_errors = '✗',
  indicator_warnings = '⚠',
  indicator_info = '◆',
  indicator_hint = '?',
  indicator_ok = '✔',
})

-- lspconfig.solargraph.setup({
--   on_attach = lsp_status.on_attach,
--   capabilities = lsp_status.capabilities
-- })

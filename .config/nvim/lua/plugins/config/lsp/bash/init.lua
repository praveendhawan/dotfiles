local lsp_utils = require('plugins.config.lsp.utils')

local server_options = {
  -- Set default client capabilities plus window/workDoneProgress
  capabilities = lsp_utils.common_config.capabilities,
  flags = lsp_utils.common_config.flags,
  filetypes = { 'sh' },
  on_attach = lsp_utils.on_attach,
}

return server_options

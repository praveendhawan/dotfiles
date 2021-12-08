local lsp_utils = require('plugins.config.lsp.utils')
local root_pattern = require('lspconfig/util').root_pattern()

local server_options = {
  -- Set default client capabilities plus window/workDoneProgress
  capabilities = lsp_utils.common_config.capabilities,
  flags = lsp_utils.common_config.flags,
  filetypes = { 'rust' },
  root_dir = root_pattern('Cargo.toml'),
  on_attach = lsp_utils.on_attach,
  settings = {
    rust = {
      build_on_save = false,
      all_features = true
    }
  }
}

return server_options

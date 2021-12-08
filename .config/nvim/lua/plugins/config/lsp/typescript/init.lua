local lsp_utils = require('plugins.config.lsp.utils')
local root_pattern = require('lspconfig/util').root_pattern()

local server_options = {
  -- Set default client capabilities plus window/workDoneProgress
  capabilities = lsp_utils.common_config.capabilities,
  flags = lsp_utils.common_config.flags,
  filetypes = { 'javascript', 'typescript', 'coffeescript', 'angular', 'vuejs' },
  root_dir = root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
  on_attach = lsp_utils.on_attach,
  settings = {
    tsserver = {
      documentFormatting = false,
    }
  }
}

return server_options

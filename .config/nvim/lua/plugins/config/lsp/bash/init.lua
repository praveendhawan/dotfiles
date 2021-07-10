local lsp_utils = require('plugins.config.lsp.utils')

lsp_utils.lsp_status_progress()

local bashls_root_path = vim.fn.stdpath('data') .. '/lspinstall/bash'

lsp_utils.lspconfig.bashls.setup {
  -- Set default client capabilities plus window/workDoneProgress
  capabilities = lsp_utils.common_config.capabilities,
  cmd = {
      "node",
       bashls_root_path .. "/node_modules/bash-language-server/bin/main.js",
      "start",
    },
  flags = lsp_utils.common_config.flags,
  filetypes = { 'sh' },
  on_attach = lsp_utils.on_attach,
}

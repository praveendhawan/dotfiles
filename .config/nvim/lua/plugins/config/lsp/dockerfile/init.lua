local lsp_utils = require('plugins.config.lsp.utils')

lsp_utils.lsp_status_progress()

local dockerls_root_path = vim.fn.stdpath('data') .. '/lspinstall/dockerfile'

lsp_utils.lspconfig.dockerls.setup {
  -- Set default client capabilities plus window/workDoneProgress
  capabilities = lsp_utils.common_config.capabilities,
  cmd = {
      "node",
       dockerls_root_path .. "/node_modules/.bin/docker-langserver",
      "--stdio",
    },
  flags = lsp_utils.common_config.flags,
  filetypes = { "Dockerfile", "dockerfile" },
  on_attach = lsp_utils.on_attach,
}

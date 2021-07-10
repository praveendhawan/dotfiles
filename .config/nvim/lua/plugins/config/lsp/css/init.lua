local lsp_utils = require('plugins.config.lsp.utils')

lsp_utils.lsp_status_progress()

local cssls_root_path = vim.fn.stdpath('data') .. '/lspinstall/css'

lsp_utils.lspconfig.cssls.setup {
  -- Set default client capabilities plus window/workDoneProgress
  capabilities = lsp_utils.common_config.capabilities,
  cmd = {
      "node",
       cssls_root_path .. "/vscode-css/css-language-features/server/dist/node/cssServerMain.js",
      "--stdio",
    },
  flags = lsp_utils.common_config.flags,
  filetypes = { 'css', 'sccs', 'less' },
  on_attach = lsp_utils.on_attach,
}

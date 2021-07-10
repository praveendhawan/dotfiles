local lsp_utils = require('plugins.config.lsp.utils')
local root_pattern = require('lspconfig/util').root_pattern()

lsp_utils.lsp_status_progress()

local ts_root_path = vim.fn.stdpath('data') .. '/lspinstall/typescript'

lsp_utils.lspconfig.tsserver.setup {
  -- Set default client capabilities plus window/workDoneProgress
  capabilities = lsp_utils.common_config.capabilities,
  cmd = {
       ts_root_path .. "/node_modules/.bin/typescript-language-server",
       '--stdio'
    },
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

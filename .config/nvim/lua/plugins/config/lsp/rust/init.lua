local lsp_utils = require('plugins.config.lsp.utils')
local root_pattern = require('lspconfig/util').root_pattern()

lsp_utils.lsp_status_progress()

local rust_analyzer_root_path = vim.fn.stdpath('data') .. '/lspinstall/rust'

lsp_utils.lspconfig.rust_analyzer.setup {
  -- Set default client capabilities plus window/workDoneProgress
  capabilities = lsp_utils.common_config.capabilities,
  cmd = {
       rust_analyzer_root_path .. "/rust-analyzer",
    },
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

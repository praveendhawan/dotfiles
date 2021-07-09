local lsp_utils = require('plugins.config.lsp.utils')

lsp_utils.lsp_status_progress()

local root_pattern = require('lspconfig/util').root_pattern()

lsp_utils.lspconfig.solargraph.setup {
  -- Set default client capabilities plus window/workDoneProgress
  capabilities = lsp_utils.common_config.capabilities,
  cmd = { 'solargraph', 'stdio' },
  flags = lsp_utils.common_config.flags,
  filetypes = { "ruby" },
  init_options = {
    formatting = true
  },
  on_attach = lsp_utils.on_attach,
  root_dir = root_pattern("Gemfile", ".git"),
  settings = {
    solargraph = {
      autoformat = false,
      checkGemVersion = true,
      completion = true,
      definitions = true,
      diagnostics = false,
      folding = false,
      formatting = true,
      hover = true,
      logLevel = 'warn',
      references = true,
      rename = true,
      symbols = true,
      transport = 'stdio',
      useBundler = false
    }
  }
}

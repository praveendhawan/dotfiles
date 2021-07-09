local lsp_status = require('lsp-status')
lsp_status.register_progress()
local root_pattern = require('lspconfig/util').root_pattern()
local on_attach = function(client, _)
  lsp_status.on_attach(client)
end

require("lspconfig").solargraph.setup {
  -- Set default client capabilities plus window/workDoneProgress
  capabilities = vim.tbl_extend('keep', {}, lsp_status.capabilities),
  cmd = { 'solargraph', 'stdio' },
  flags = {
    debounce_text_changes = 150,
  },
  filetypes = { "ruby" },
  init_options = {
    formatting = true
  },
  on_attach = on_attach,
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

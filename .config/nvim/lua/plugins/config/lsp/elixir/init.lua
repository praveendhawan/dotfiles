local lsp_utils = require('plugins.config.lsp.utils')
local root_pattern = require('lspconfig/util').root_pattern()

lsp_utils.lsp_status_progress()

local elixirls_root_path = vim.fn.stdpath('data') .. '/lspinstall/elixir'

lsp_utils.lspconfig.elixirls.setup {
  -- Set default client capabilities plus window/workDoneProgress
  capabilities = lsp_utils.common_config.capabilities,
  cmd = {
       elixirls_root_path .. "/elixir-ls/language_server.sh"
    },
  flags = lsp_utils.common_config.flags,
  filetypes = { 'elixir', 'eelixir' },
  root_dir = root_pattern("mix.exs", ".git"),
  on_attach = lsp_utils.on_attach,
}

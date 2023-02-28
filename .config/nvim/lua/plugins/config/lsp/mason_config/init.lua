require("mason-lspconfig").setup()

-- https://github.com/williamboman/mason-lspconfig.nvim/issues/18
require("mason-lspconfig").setup_handlers({
  function (server_name) -- default handler (optional)
    local default_opts = {}

    local server_configs = {
      ['bashls'] = require 'plugins.config.lsp.bash',
      ['cssls'] = require 'plugins.config.lsp.css',
      -- ['dockerls'] = require 'plugins.config.lsp.dockerfile',
      ['elixirls'] = require 'plugins.config.lsp.elixir',
      -- ['eslint'] = require 'plugins.config.lsp.eslint',
      -- ['rust_analyzer'] = require 'plugins.config.lsp.rust',
      ['solargraph'] = require 'plugins.config.lsp.ruby',
      ['sumneko_lua'] = require 'plugins.config.lsp.lua',
      ['tsserver'] = require 'plugins.config.lsp.typescript',
    }

    local server_opts = server_configs[server_name]

    require("lspconfig")[server_name].setup {server_opts}
  end,
})


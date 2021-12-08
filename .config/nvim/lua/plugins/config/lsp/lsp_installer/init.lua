local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {}

    local server_opts = {
      ['bashls'] = require 'plugins.config.lsp.bash',
      ['cssls'] = require 'plugins.config.lsp.css',
      ['dockerls'] = require 'plugins.config.lsp.dockerfile',
      ['elixirls'] = require 'plugins.config.lsp.elixir',
      -- ['eslint'] = require 'plugins.config.lsp.eslint',
      ['rust_analyzer'] = require 'plugins.config.lsp.rust',
      ['solargraph'] = require 'plugins.config.lsp.ruby',
      ['sumneko_lua'] = require 'plugins.config.lsp.lua',
      ['tsserver'] = require 'plugins.config.lsp.typescript',
    }

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    local server_options = server_opts[server.name] or opts
    server:setup(server_options)
end)

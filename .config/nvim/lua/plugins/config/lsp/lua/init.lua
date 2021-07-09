local lsp_utils = require('plugins.config.lsp.utils')

lsp_utils.lsp_status_progress()

-- set the path to the sumneko installation;
-- Installed by LspInstall lua
local sumneko_root_path = vim.fn.stdpath('data') .. '/lspinstall/lua'

local sumneko_binary = sumneko_root_path .. '/sumneko-lua-language-server'

lsp_utils.lspconfig.sumneko_lua.setup {
  -- Set default client capabilities plus window/workDoneProgress
  capabilities = lsp_utils.common_config.capabilities,
  cmd = { sumneko_binary };
  flags = lsp_utils.common_config.flags,
  filetypes = { 'lua' },
  on_attach = lsp_utils.on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
        maxPreload = 100000,
        preloadFileSize = 1000,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      }
    },
  },
}

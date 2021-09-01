-- local reloader = require('plenary.reload')
local config = {}

config.list = {
-- Nvim Config
  'config',
-- Nvim Keybindings Overrides
  'config.keybindings',
  'config.external_commands_keybindings',
-- Profiler
-- 'local_repo.profiler',
-- Run the following command to profile
-- env AK_PROFILER=1 nvim some_file 2>&1 >/dev/null | less
-- List of Plugins
  'plugins',
  'plugins.config.lsp.bash',
  'plugins.config.lsp.css',
  'plugins.config.lsp.dockerfile',
  'plugins.config.lsp.elixir',
  'plugins.config.lsp.lua',
  'plugins.config.lsp.ruby',
  'plugins.config.lsp.rust',
  'plugins.config.lsp.typescript'
}

-- Load Module Function
function config.load()
  for _, module in pairs(config.list) do
    require(module)
  end
  print('Config Loaded')
end

-- Reload Config Function
-- function config.reload()
--   vim.cmd([[LspStop]])
--   print('Stop all running LSPs')
--   for _, module in pairs(config.list) do
--     reloader.reload_module(module)
--   end
--   print('Config Modules Removed')
--   config.load()
-- end

return config

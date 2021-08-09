local reloader = require('plenary.reload')
local config = {}

config.list = {
-- Nvim Config
  'config',
-- Nvim Keybindings Overrides
  'config.keybindings',
  'config.external_commands_keybindings',
-- List of Plugins
  'plugins',
-- Plugins Config
  'plugins.config.ale',
  'plugins.config.bufferline',
  'plugins.config.colors',
  'plugins.config.gitsigns',
  'plugins.config.gutentags',
-- LSP Config
  'plugins.config.lsp',
  'plugins.config.lsp.bash',
  'plugins.config.lsp.compe',
  'plugins.config.lsp.css',
  'plugins.config.lsp.dockerfile',
  'plugins.config.lsp.elixir',
  'plugins.config.lsp.lsp_install',
  'plugins.config.lsp.lua',
  'plugins.config.lsp.ruby',
  'plugins.config.lsp.rust',
  'plugins.config.lsp.snippets',
  'plugins.config.lsp.typescript',
-- LSP END
  'plugins.config.lualine',
  'plugins.config.matchup',
  -- 'plugins.config.neogit',
  'plugins.config.nvim_tree',
  'plugins.config.nvim_web_devicons',
  'plugins.config.quick_scope',
  'plugins.config.scratch',
  'plugins.config.splitjoin',
  'plugins.config.telescope',
  'plugins.config.telescope_fzf',
  'plugins.config.treesitter',
  'plugins.config.treesitter.context',
  'plugins.config.treesitter.folding',
  'plugins.config.treesitter.indentation',
  'plugins.config.treesitter.matchup',
  'plugins.config.treesitter.refactor',
  'plugins.config.treesitter.syntax_highlight',
  'plugins.config.vim_test',
-- Plugings Keybindings
  'plugins.keybindings.lazygit',
  'plugins.keybindings.lsp',
  'plugins.keybindings.quick_scope',
  'plugins.keybindings.nvim_tree',
  'plugins.keybindings.telescope',
  'plugins.keybindings.vim_test',
-- TreeSitter
  'treesitter.incremental_selection',
  'treesitter.playground',
  'treesitter.textobjects',
-- Functions
  'functions.gbrowse',
  'functions.config_reloader',
}

-- Load Module Function
function config.load()
  for _, module in pairs(config.list) do
    require(module)
  end
  print('Config Loaded')
end

-- Reload Config Function
function config.reload()
  vim.cmd([[LspStop]])
  print('Stop all running LSPs')
  for _, module in pairs(config.list) do
    reloader.reload_module(module)
  end
  print('Config Modules Removed')
  config.load()
end

return config

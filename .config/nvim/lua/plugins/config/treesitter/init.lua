-- Temporary Fix for
-- https://github.com/nvim-treesitter/nvim-treesitter/pull/2801
-- Although this was reverted here -
-- https://github.com/nvim-treesitter/nvim-treesitter/pull/2833
-- But I am still getting those deprecation warnings.
--
-- Fix was suggested in this reddit thread:
-- https://www.reddit.com/r/neovim/comments/u6eu0q/treesitter_breaking_plugins/

local ts_utils = require("nvim-treesitter.ts_utils")
ts_utils.get_node_text = vim.treesitter.query.get_node_text

require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    'bash',
    'comment',
    'css',
    -- 'elixir',
    'html',
    'javascript',
    'json',
    'lua',
    'ruby',
    -- 'rust',
    'scss',
    'typescript',
    'vue',
    'yaml'
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Highlight
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  -- Incremental Selection
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  -- Indentation for =
  indent = {
    enable = true
  },
  -- Matchup
  matchup = {
    enable = true              -- mandatory, false will disable the whole extension
  },
}
-- Folding
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldmethod = 'expr'
vim.o.foldenable = false

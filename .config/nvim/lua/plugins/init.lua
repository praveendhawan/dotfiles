-- Package Managament with wbthomason/packer.nvim
-- ########## BOOTSTRAP ############
local execute = vim.api.nvim_command

-- vim.fn.stdpath('data') => ~/.local/share/nvim
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '.. install_path)
  execute 'packadd packer.nvim'
end

-- impatient needs to be setup before any other lua plugin is loaded
-- so it is recommended you add the following near the start of your init.vim
require('impatient')

-- ############ END ################

-- Autocompile packer if changes in init.lua
vim.api.nvim_exec([[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]], false)

-- Install Packages
local use = require('packer').use

-- Improved Startup Time
-- https://elianiva.my.id/post/improving-nvim-startup-time
require('packer').startup(function()
  -- Install and updates self
  -- Packer
  use 'wbthomason/packer.nvim'
  -- Used module to load it only when a plugin requires it
  use {
    "nvim-lua/plenary.nvim",
    module = "plenary"
  }
  -- Nvim Tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require 'plugins.config.nvim_tree'
      require 'plugins.keybindings.nvim_tree'
    end
  }
  -- Web DevIcons
  -- Used module to load it only when a plugin requires it
  use {
    'kyazdani42/nvim-web-devicons',
    module = "nvim-web-devicons",
    config = function()
      require 'plugins.config.nvim_web_devicons'
    end
  }
  -- StatusLine
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons' },
    after = { 'gitsigns.nvim' },
    config = function()
      require 'plugins.config.lualine'
    end
  }
  -- Show buffer name and number is tabline
  use {
    'akinsho/nvim-bufferline.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require 'plugins.config.bufferline'
    end
  }

  -- Git Gutter
  -- Load plugin on buffer read event
  use {
  'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require 'plugins.config.gitsigns'
    end
  }

  -- Lazygit
  -- Load plugin on buffer read event and when its called via cmd or keys
  use {
    'kdheepak/lazygit.nvim',
    cmd = { "Lazygit", "LazyGitConfig" },
    keys = "<leader>gg",
    config = function()
      require 'plugins.keybindings.lazygit'
    end
  }

  -- Fix trailing Whitespace and highlight whitespace
  -- Load plugin on buffer read event and when its called via cmd or keys
  use {
    'bronson/vim-trailing-whitespace',
    event = "BufReadPost",
    cmd = "FixWhitespace"
  }

  -- coffeescript support (syntax) etc.
  -- Load plugin only for coffee filetype
  use {
    'kchmck/vim-coffee-script',
    ft = 'coffee'
  }

  -- add 'end' to def, if, do etc.
  -- use 'tpope/vim-endwise'

  -- ctags mgmt
  use {
    'ludovicchabant/vim-gutentags',
    event = { "BufReadPost", "BufWritePost" },
    config = function()
      require 'plugins.config.gutentags'
    end
  }

  -- Match Word Jump and Highlights
  use {
    'andymass/vim-matchup',
    after = "nvim-treesitter",
    config = function()
      require 'plugins.config.matchup'
    end
  }

  -- New Autocomplete Framework + LSP
  use 'hrsh7th/nvim-cmp'
  -- LSP source for cmp
  use 'hrsh7th/cmp-nvim-lsp'
  -- Buffer Source for cmp
  use { 'hrsh7th/cmp-buffer', disable = true }
  -- Luasnip Source for cmp
  use 'saadparwaiz1/cmp_luasnip'
  -- nvim lua API Source for cmp
  use 'hrsh7th/cmp-nvim-lua'
  -- Treesitter Source for cmp
  use 'ray-x/cmp-treesitter'
  -- Calc Source for cmp
  use { 'hrsh7th/cmp-calc', disable = true }
  -- Spell Source for cmp
  use { 'f3fora/cmp-spell', disable = true }
  -- Tags Source for cmp
  use 'quangnguyen30192/cmp-nvim-tags'
  -- LSP for nvim
  use 'neovim/nvim-lspconfig'
  -- LSP Install
  use 'williamboman/nvim-lsp-installer'
  -- LSP autocomplete kind icons and text
  use 'onsails/lspkind-nvim'
  -- Snippets
  use {
    'L3MON4D3/LuaSnip',
    config = function()
      require 'plugins.config.lsp.snippets'
    end
  }
  -- For Linting and Fixing
  use {
    'dense-analysis/ale',
    event = "BufReadPost",
    config = function()
      require 'plugins.config.ale'
    end
  }

  -- Vue JS syntax
  use { 'posva/vim-vue', ft = "vue" }


  -- Taming the quickfix window :)
  use { 'romainl/vim-qf', ft = "qf" }

  -- Colorschemes for Vim
  -- Seti
  -- use 'trusktr/seti.vim'
  -- GruvBox
  -- use {
  --   "npxbr/gruvbox.nvim",
  --   requires = {
  --     {"rktjmp/lush.nvim"}
  --   }
  -- }

  use {
    'folke/tokyonight.nvim',
    config = function()
      require 'plugins.config.colors'
    end
  }

  -- quick scope for jumping to words in line
  -- Load plugin on calling
  use {
    'unblevable/quick-scope',
    keys = "<Plug>(QuickScopeToggle)",
    config = function()
      require 'plugins.config.quick_scope'
      require 'plugins.keybindings.quick_scope'
    end
  }

  -- switching between a single-line statement and a multi-line one
  -- Load plugin on calling
  use {
    'AndrewRadev/splitjoin.vim',
    event = "BufReadPost",
    config = function()
      require 'plugins.config.splitjoin'
      require 'plugins.keybindings.splitjoin'
    end
  }

  -- ScratchPad for VIm
  -- Load plugin on calling
  use {
    'mtth/scratch.vim',
    cmd = "Scratch",
    config = function()
      require 'plugins.config.scratch'
    end
  }

  -- Comment
  use 'tpope/vim-commentary'

  -- Running Tests in vim
  -- Load plugin on calling
  use {
    'vim-test/vim-test',
    event = "BufReadPost",
    config = function()
      require 'plugins.config.vim_test'
      require 'plugins.keybindings.vim_test'
    end
  }

  -- VIM TMUX NAVIGATOR
  use 'christoomey/vim-tmux-navigator'

  -- YAML Nested Key Finder
  use { 'henrik/vim-yaml-helper', ft = "yaml" }

  -- Treesitter
  -- load it only if there’s a file loaded in a buffer
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    event = "BufRead",
    config = function()
      require 'plugins.config.treesitter'
    end
  }
  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = "nvim-treesitter"
  }
  use {
    'nvim-treesitter/playground',
    cmd = { 'TSPlaygroundToggle' },
    after = "nvim-treesitter"
  }
  use {
    'romgrk/nvim-treesitter-context',
    after = "nvim-treesitter",
    config = function()
      require 'plugins.config.treesitter.context'
    end
  }
  use {
    'nvim-treesitter/nvim-treesitter-refactor',
    after = "nvim-treesitter"
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'}
    },
    config = function()
      require 'plugins.config.telescope'
      require 'plugins.keybindings.telescope'
    end
  }

  -- use {
  --   'nvim-telescope/telescope-fzf-writer.nvim',
  --   requires = {
  --     { 'nvim-telescope/telescope.nvim' }
  --   },
  --   after = "telescope.nvim",
  --   config = function()
  --     require 'plugins.config.telescope_fzf_writer'
  --   end
  -- }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    requires = {
      { 'nvim-telescope/telescope.nvim' }
    },
    run = 'make',
    after = "telescope.nvim",
    config = function()
      require 'plugins.config.telescope_fzf_native'
    end
  }


  use {
    'nvim-telescope/telescope-project.nvim',
    requires = {
      { 'nvim-telescope/telescope.nvim' }
    },
    after = "telescope.nvim",
    config = function()
      require 'plugins.config.telescope_project'
    end
  }

  -- Dash Integration via Telescope
  use {
    'mrjones2014/dash.nvim',
    requires = {
      'nvim-telescope/telescope.nvim'
    },
    after = "telescope.nvim",
    run = 'make install',
    config = function()
      require 'plugins.config.telescope_dash'
    end
  }

  -- Searcher/Replacer/Grepper
  use {
    'wincent/ferret',
    cmd = { 'Ack', 'Ack!', 'Lack', 'Lack!' },
    keys = { '<C-f>' },
    config = function()
      require 'plugins.config.ferret'
      require 'plugins.keybindings.ferret'
    end
  }

  use {
    'folke/zen-mode.nvim',
    after = 'tokyonight.nvim',
    cmd = { 'ZenMode' },
    config = function()
      require("zen-mode").setup({})
    end
  }
  use {
    'folke/twilight.nvim',
    after = 'tokyonight.nvim',
    cmd = { 'Twilight', 'TwilightEnable', 'TwilightDisable' },
    config = function()
      require("twilight").setup({})
    end
  }

  -- Github Copilot
  use {
    'github/copilot.vim',
    config = function()
      require 'plugins.config.copilot'
    end
  }
  -- Vim Rails
  use {
    'tpope/vim-rails'
  }
  -- Impatient vim - improves startup time
  use {
    'lewis6991/impatient.nvim'
  }
end)

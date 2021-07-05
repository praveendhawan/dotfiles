-- Package Managament with wbthomason/packer.nvim

-- ########## BOOTSTRAP ############
local execute = vim.api.nvim_command

-- vim.fn.stdpath('data') => ~/.local/share/nvim
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '.. install_path)
  execute 'packadd packer.nvim'
end
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
require('packer').startup(function()
  -- Install and updates self
  -- Packer
  use 'wbthomason/packer.nvim'
  -- Nvim Tree
  use 'kyazdani42/nvim-tree.lua'
  -- Web DevIcons
  use 'kyazdani42/nvim-web-devicons'
  -- Fuzzy File Finder
  -- Activate it using :FZF or ctrl + p in normal mode
  -- use 'junegunn/fzf'
  -- StatusLine
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  -- Show buffer name and number is tabline
  use {
    'akinsho/nvim-bufferline.lua',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Git support for vim
  -- This ia also necessary for showing the branch in airline status bar
  use 'tpope/vim-fugitive'
  -- Enables Gbrowse from Gblame
  use 'tpope/vim-rhubarb'
  -- Git gutter
  use 'mhinz/vim-signify'

  -- Fix trailing Whitespace and highlight whitespace
  use 'bronson/vim-trailing-whitespace'

  -- coffeescript support (syntax) etc.
  use 'kchmck/vim-coffee-script'

  -- to run grep asynchronously
  -- use 'mhinz/vim-grepper'
  -- use 'jremmen/vim-ripgrep'
  -- use 'dyng/ctrlsf.vim'

  -- add 'end' to def, if, do etc.
  -- use 'tpope/vim-endwise'

  -- ctags mgmt
  use 'ludovicchabant/vim-gutentags'

  -- Match Word Jump and Highlights
  use 'andymass/vim-matchup'

  -- New Autocomplete Framework
  -- Install Node and yarn first
  -- For ruby completion do - 'gem install solargraph'
  -- Then Install coc plugin - https://www.npmjs.com/package/coc-solargraph - ':CocInstall coc-solargraph'
  -- To Setup Elixir LS - https://bernheisel.com/blog/vim-elixir-ls-plug/
  use { 'neoclide/coc.nvim', branch = 'release' }

  -- For Linting and Fixing
  use 'dense-analysis/ale'

  -- Dash support plugin for vim
  -- NOTE: Only works on mac as Dash is only on Mac
  use 'rizzatti/dash.vim'

  -- Vue JS syntax
  use 'posva/vim-vue'


  -- Taming the quickfix window :)
  use 'romainl/vim-qf'

  -- Colorschemes for Vim
  -- Seti
  use 'trusktr/seti.vim'

  -- Vader for vim script tests
  use 'junegunn/vader.vim'

  -- quick scope for jumping to words in line
  use 'unblevable/quick-scope'

  -- switching between a single-line statement and a multi-line one
  use 'AndrewRadev/splitjoin.vim'

  -- ScratchPad for VIm
  use 'mtth/scratch.vim'

  -- Comment
  use 'tpope/vim-commentary'

  -- Running Tests in vim
  use 'vim-test/vim-test'

  -- VIM TMUX NAVIGATOR
  use 'christoomey/vim-tmux-navigator'

  -- YAML Nested Key Finder
  use 'henrik/vim-yaml-helper'

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/playground'
  use 'romgrk/nvim-treesitter-context'

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'}
    }
  }

  -- Telescope extension for coc
  use {
    'fannheyward/telescope-coc.nvim',
    requires = {
      { 'nvim-telescope/telescope.nvim' }
    }
  }
end)

return {
  -- Prettier
  {
    "stevearc/conform.nvim",
    config = function()
      require "configs.conform"
    end,
  },
  -- LSP
  {
  	"williamboman/mason.nvim",
    opts = require('configs.mason')
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  -- Treesitter
  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = require("configs.treesitter")
  },
  -- Split and Join Blocks
  {
    'Wansmer/treesj',
    cmd = { 'TSJToggle', 'TSJJoin', 'TSJSplit' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('treesj').setup({
        use_default_keymaps = false,
        max_join_length = 100,
      })
    end,
  },
  -- Nvim Folder Tree
  {
    "nvim-tree/nvim-tree.lua",
    opts = require("configs.nvimtree"),
  },
  -- Lazygit
  {
    'kdheepak/lazygit.nvim',
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },
  -- Local LLM
  {
    "David-Kunz/gen.nvim",
    cmd = { 'Gen' },
    event = "InsertEnter",
    config = function()
      require "configs.gen-llm"
    end,
    cond = function()
      return vim.fn.has('mac') == 1
    end
  },
  -- Vim Test
  {
    "klen/nvim-test",
    cmd = { 'TestNearest', 'TestFile', 'TestEdit', 'TestVisit' },
    config = function ()
      require("nvim-test").setup{
        silent = false,
        term = "terminal"
      }
    end
  },
  -- Clipboard
  {
    'ojroques/nvim-osc52',
    cond = function()
        -- Check if connection is ssh
        return os.getenv("SSH_CLIENT") ~= nil
    end,
    event = "TextYankPost",
    config = function()
      require 'configs.oscyank'
    end
  },
  -- Telescope
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = require("configs.telescope")
  },
  -- Copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("configs.copilot")
    end
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    config = function()
      require("CopilotChat").setup()
    end
  },
  -- CMP
  {
    "hrsh7th/nvim-cmp",
    opts = require("configs.cmp").opts_overrides,
    dependencies = {
      'ray-x/cmp-treesitter',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp',
      -- {
      --   'tzachar/cmp-ai',
      --   config = require("configs.cmp").cmp_ai_setup
      -- },
      {
        "zbirenbaum/copilot-cmp",
        config = function ()
          require("copilot_cmp").setup()
        end
      }
    }
  },
}


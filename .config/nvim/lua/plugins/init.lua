return {
  -- Prettier
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    config = function()
      require "configs.conform"
    end,
  },
  -- LSP
  {
    "williamboman/mason.nvim",
    opts = require "configs.mason",
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
    opts = require "configs.treesitter",
  },
  -- Split and Join Blocks
  {
    "Wansmer/treesj",
    cmd = { "TSJToggle", "TSJJoin", "TSJSplit" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup {
        use_default_keymaps = false,
        max_join_length = 100,
      }
    end,
  },
  -- Nvim Folder Tree
  {
    "nvim-tree/nvim-tree.lua",
    opts = require "configs.nvimtree",
  },
  -- Lazygit
  {
    "kdheepak/lazygit.nvim",
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
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
  -- Local LLM
  {
    "David-Kunz/gen.nvim",
    cmd = { "Gen" },
    config = function()
      require "configs.gen-llm-new"
    end,
    cond = function()
      return vim.fn.has "mac" == 1
    end,
  },
  -- Vim Test
  {
    "klen/nvim-test",
    cmd = { "TestNearest", "TestFile", "TestEdit", "TestVisit" },
    config = function()
      require("nvim-test").setup {
        silent = false,
        term = "terminal",
      }
    end,
  },
  -- Telescope
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = require "configs.telescope",
  },
  -- Copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require "configs.copilot"
    end,
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
    end,
    cmd = "CopilotChat",
  },
  -- CMP
  {
    "hrsh7th/nvim-cmp",
    -- because we are using the require statements in the cmp config file
    -- NVChad suggests to transform the opts to a function
    -- It says - https://nvchad.com/docs/config/plugins#manage_plugins -> Telescope example
    -- If your opts uses a function call ex: require*, then make opts spec a function
    -- should return the modified default config as well
    opts = function()
      local opts_overrides = require("configs.cmp").opts_overrides
      local conf = require "nvchad.configs.cmp"
      -- vim.tbl_deep_extend("force", conf, opts_overrides)
      -- somehow the above code doesnt work and overrides the sources
      conf.sources = opts_overrides.sources
      conf.sorting = opts_overrides.sorting
      -- vim.print(vim.inspect(conf))
      -- table.insert(conf.sources, opts_overrides.sources)
      return conf
    end,
    dependencies = {
      "ray-x/cmp-treesitter",
      {
        "JosefLitos/cmp-copilot",
        config = function()
          require("cmp_copilot").setup()
        end,
        -- dev = true
      },
      -- 'hrsh7th/cmp-buffer', -- included in Nvchad
      -- 'hrsh7th/cmp-nvim-lua', -- included in Nvchad
      -- 'hrsh7th/cmp-nvim-lsp', -- included in Nvchad
      -- {
      --   'tzachar/cmp-ai',
      --   config = require("configs.cmp").cmp_ai_setup
      -- },
    },
  },
  -- Open file on github
  {
    "almo7aya/openingh.nvim",
    cmd = { "OpenInGHRepo", "OpenInGHFile", "OpenInGHFileLines" },
  },
  --  Better Folds
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    config = function()
      require "configs.ufofolding"
    end,
    cmd = { "UfoEnable", "UfoEnableFold" },
  },

  -- D2 Diagrams
  {
    "terrastruct/d2-vim",
    ft = "d2",
  },
}

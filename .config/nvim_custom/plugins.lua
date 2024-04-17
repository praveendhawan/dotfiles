local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  -- TreeSitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

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

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
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

  -- CMP
  {
    "hrsh7th/nvim-cmp",
    opts = {
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
        { name = "copilot" },
        { name = "treesitter" }
      }
    },

    dependencies = {
      {
        "hrsh7th/cmp-copilot",
        dependencies = {
          'github/copilot.vim',
          event = "InsertEnter",
          config = function ()
            local node_path = vim.fn.system('asdf where nodejs 16.5.0'):gsub('\n', '')
            node_path = node_path .. '/bin/node'
            vim.g.copilot_node_command = node_path
            -- vim.cmd(string.format("let g:copilot_node_command = '%s'", node_path))
          end
        }
      },
      'ray-x/cmp-treesitter',
    }
  },

  -- For Chat support for Local LLMs
  {
    "David-Kunz/gen.nvim",
    cmd = { 'Gen' },
    event = "InsertEnter",
    config = function()
      require "custom.configs.gen-llm"
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

  {
    'ojroques/nvim-osc52',
    cond = function()
        -- Check if connection is ssh
        return os.getenv("SSH_CLIENT") ~= nil
    end,
    event = "TextYankPost",
    config = function()
      require 'custom.oscyank'
    end
  },

  -- Telescope
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    -- config = function()
    --   require("telescope").load_extension "fzf"
    -- end,
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope
  }

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins

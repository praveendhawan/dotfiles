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
  -- Vim Test
  {
    "klen/nvim-test",
    cmd = { "TestNearest", "TestFile", "TestEdit", "TestVisit" },
    config = function()
      require "configs.nvim-tests"
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
  -- AI
  {
    "olimorris/codecompanion.nvim",
    cmd = {
      "CodeCompanionChat",
      "CodeCompanion",
      "CodeCompanionActions",
      "CodeCompanionCmd",
    },
    opts = require "configs.codecompanion",
    dependencies = {
      "nvim-lua/plenary.nvim", -- For async
      "nvim-treesitter/nvim-treesitter", -- For file pickers
      -- For MCP
      {
        "ravitemer/mcphub.nvim",
        cmd = "MCPHub",
        build = "bundled_build.lua",
        config = function()
          require("mcphub").setup()
        end
      },
      -- For rendering the markdown in the chat buffer
      {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = { "markdown", "codecompanion" }
      },
      -- to copy images from your system clipboard into a chat buffer via :PasteImage
      -- For Mac it depends on pngpaste - `brew install pngpaste`
      {
        "HakonHarnes/img-clip.nvim",
        opts = {
          filetypes = {
            codecompanion = {
              prompt_for_file_name = false,
              template = "[Image]($FILE_PATH)",
              use_absolute_path = true,
            },
          },
        },
      },
    },
  },
    -- CMP
  { import = "nvchad.blink.lazyspec" },
  {
    "Saghen/blink.cmp",
    opts = {
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        per_filetype = {
          codecompanion = { 'codecompanion', 'lsp', 'path', 'buffer' }
        }
      }
    },
  },
  --  for a cleaner diff when using the inline assistant or the @editor tool
  {
    "echasnovski/mini.diff",
    config = function()
      local diff = require("mini.diff")
      diff.setup({
        -- Disabled by default
        source = diff.gen_source.none(),
        view = {
          style = "sign"
        }
      })
    end,
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
  --
  -- -- D2 Diagrams
  -- {
  --   "terrastruct/d2-vim",
  --   ft = "d2",
  -- },
}

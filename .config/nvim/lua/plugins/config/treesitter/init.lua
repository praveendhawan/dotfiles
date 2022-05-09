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
    'dockerfile',
    'elixir',
    'html',
    'javascript',
    'json',
    'lua',
    'ruby',
    'rust',
    'scss',
    'typescript',
    'typescript',
    'vue',
    'yaml'
  },

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
  -- Treesitter Refactor
  refactor = {
    -- Highlights definition and usages of the current symbol under the cursor.
    highlight_definitions = { enable = true, clear_on_cursor_move = true },
    -- Highlights the block from the current scope where the cursor is.
    highlight_current_scope = { enable = true },
    -- Renames the symbol under the cursor within the current scope (and current file).
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },
    -- "go to definition" for the symbol under the cursor,
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gnd",
        -- Somehow the below keymaps dont work
        -- goto_next_usage = "<a-*>", -- ALT/META + *
        -- goto_previous_usage = "<a-#>" -- ALT/META + #
      }
    }
  },
  -- Text Objects
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
    lsp_interop = {
      enable = true,
      peek_definition_code = {
        ["<leader>df"] = "@function.outer",
        ["<leader>dF"] = "@class.outer",
      },
    },
  },
  -- Playground
  playground = {
    enable = false,
    -- disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
}
-- Folding
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldmethod = 'expr'
vim.o.foldenable = false

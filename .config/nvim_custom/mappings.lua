---@type MappingsTable
local M = {}

local custom_functions = require "custom.functions"

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    -- Copy Full File path to system clipboard
    ["<leader>rf"] = { ":let @+=expand('%:p')<CR>", 'Copy absolute file path' },
    -- Copy File path relative to current directory
    ["<leader>rr"] = { ':let @+=expand("%:p:.")<CR>', 'Copy relative file path' },
    -- Copy just file name to system clipboard
    ["<leader>rc"] = { ':let @+=expand("%:t")<cr>', 'Copy file name' },
    -- Ctree
    ["<leader>ct"] = {
      function()
        custom_functions.ctree_builder(vim.fn.expand('%:p:.:h'))
      end,
      'Build Component tree'
    },
    -- Close all buffers except current one
    ["bda"] = { '<cmd> %bd|e#|bd#<cr>', 'Close all buffers except current'},
    -- Close all buffers
    ["bca"] = { '<cmd> %bufdo bd', 'Close all buffers except current'}
  },
}

M.lazygit = {
  n = {
    ["<leader>gg"] = { ":LazyGit<CR>", 'Toggle Lazygit', opts = { noremap = true } }
  }
}

M.treesitter = {
  n = {
    ["<leader>s"] = { ":TSJToggle<CR>", 'Toggle Split and Join block', opts = { noremap = true } }
  }
}

M.tests = {
  n = {
    ["<leader>tn"] = { ":TestNearest<CR>", 'Test Nearest', opts = { silent = true } },
    ["<leader>tf"] = { ":TestFile<CR>", 'Test File', opts = { silent = true } }
  }
}

M.telescope = {
  n = {
    ["<leader>ft"] = { "<cmd> Telescope treesitter <CR>", 'Treesitter symbols', opts = { noremap = true } }
  }
}

-- more keybinds!

return M
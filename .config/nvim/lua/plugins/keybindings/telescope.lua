local actions = require('telescope.actions')
local telescope_builtin = require('telescope.builtin')
local telescope_themes = require('telescope.themes')
local TelescopeConfig = {
  find_files = function()
    telescope_builtin.find_files(
      telescope_themes.get_dropdown({ preview = false })
    )
  end,

  list_projects = function()
    require("telescope").extensions.project.project({ display_type = "full" })
  end,

  dash_search = function()
    require('dash').search(false, vim.fn.expand("<cword>"))
  end
}

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        -- Use esc to close telescope
        -- otherwise need to press esc 2 times,
        -- one to go to normal mode and other to close
        ["<esc>"] = actions.close,
        -- Use Location list instead of quickfix List
        ["<C-q>"] = actions.smart_send_to_loclist + actions.open_loclist
      },
      n = {
        -- Use Location list instead of quickfix List
        ["<C-q>"] = actions.smart_send_to_loclist + actions.open_loclist
      }
    }
  },
  pickers = {
    buffers = {
      mappings = {
        i = {
          -- Ctrl + D to delete buffer from buffers picker
          ["<C-d>"] = actions.delete_buffer
        }
      }
    }
  }
}

-- Use Telescope Instead of FZF
-- Ctrl + p
-- vim.api.nvim_set_keymap(
--   'n',
--   '<C-p>',
--   "<cmd>lua require('telescope').extensions.fzf_writer.files(require('telescope.themes').get_dropdown({ preview = false }))<cr>",
--   noremap_silent_opt
-- )

vim.api.nvim_set_keymap(
  'n',
  '<C-p>',
  '',
  {
    callback = TelescopeConfig.find_files,
    desc = 'Find Files'
  }
)
-- \fb for switching to buffers
vim.api.nvim_set_keymap(
  'n',
  '<leader>fb',
  '',
  {
    callback = telescope_builtin.buffers,
    desc = 'List Buffers'
  }
)
-- \fh for help tags
vim.api.nvim_set_keymap(
  'n',
  '<leader>fh',
  '',
  {
    callback = telescope_builtin.help_tags,
    desc = 'List Help Tags'
  }
)
-- \ft Treesitter symbols list of current buffer
vim.api.nvim_set_keymap(
  'n',
  '<leader>ft',
  '',
  {
    callback = telescope_builtin.treesitter,
    desc = 'List Treesitter Symbols'
  }
)

-- \fk Treesitter symbols list of current buffer
vim.api.nvim_set_keymap(
  'n',
  '<leader>fk',
  '',
  {
    callback = telescope_builtin.keymaps,
    desc = 'List Keymaps'
  }
)

-- \fg Lists git commits with diff preview
vim.api.nvim_set_keymap(
  'n',
  '<leader>fgc',
  '',
  {
    callback = telescope_builtin.git_commits,
    desc = 'List Git Commits'
  }
)

-- \fgc Lists git commits with diff preview for the buffer
vim.api.nvim_set_keymap(
  'n',
  '<leader>fgbc',
  '',
  {
    callback = telescope_builtin.git_bcommits,
    desc = 'List Git Commits with preview for the buffer'
  }
)

-- \fgb Lists all branches with log preview
vim.api.nvim_set_keymap(
  'n',
  '<leader>fgb',
  '',
  {
    callback = telescope_builtin.git_branches,
    desc = 'List Git Branches'
  }
)

-- \fp Lists all projects
vim.api.nvim_set_keymap(
  'n',
  '<leader>fp',
  '',
  {
    callback = TelescopeConfig.list_projects,
    desc = 'List Projects'
  }
)

-- \fd Search in dash for documentation
vim.api.nvim_set_keymap(
  'n',
  '<leader>fd',
  '',
  {
    callback = TelescopeConfig.dash_search,
    desc = 'Search Dash'
  }
)

-- \fo Search in dash for documentation
vim.api.nvim_set_keymap(
  'n',
  '<leader>fo',
  '',
  {
    callback = telescope_builtin.oldfiles,
    desc = 'Recently Opened Files'
  }
)


-- \fc Search in dash for documentation
vim.api.nvim_set_keymap(
  'n',
  '<leader>fc',
  '',
  {
    callback = telescope_builtin.commands,
    desc = 'Vim commands'
  }
)

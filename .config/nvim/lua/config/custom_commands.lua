-- This file contains my custom commands for Neovim

-- Close all buffers except current one
vim.api.nvim_create_user_command(
  'BufCloseAllExceptCurrent',
  'execute "%bd|e#|bd#"',
  {}
)
vim.api.nvim_command('abbr bca BufCloseAllExceptCurrent')

-- Close all buffers
vim.api.nvim_create_user_command(
  'BufCloseAll',
  'execute "%bufdo bd"',
  {}
)
vim.api.nvim_command('abbr bda BufCloseAll')

------------------------------------------------------------------------
-- GBROWSE
vim.api.nvim_create_user_command(
  'OpenOnGithub',
  'lua require("functions").OpenOnGithub()',
  {}
)

-- Create keybinding
vim.api.nvim_set_keymap('n', '<leader>og', ':OpenOnGithub<CR>', { noremap = true })

------------------------------------------------------------------------

-- Rename current File
vim.api.nvim_create_user_command(
  'Rename',
  function(options)
    require("functions").rename(options.fargs[1], options.bang)
  end,
  {nargs = 1}
)

------------------------------------------------------------------------

-- Ctree
vim.api.nvim_create_user_command(
  'BuildComponentTree',
  "lua require('functions').component_tree_builder(vim.fn.expand('%:p:.:h'))",
  {}
)

vim.api.nvim_command('abbr ctree BuildComponentTree')
------------------------------------------------------------------------

local noremap_silent_opt = { noremap = true, silent = true}

-- \fu Lists harpoon marks
vim.api.nvim_set_keymap(
  'n',
  '<leader>fu',
  ':Telescope harpoon marks<cr>',
  noremap_silent_opt
)


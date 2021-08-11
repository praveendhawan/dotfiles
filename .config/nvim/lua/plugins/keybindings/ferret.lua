local noremap_opt = { noremap = true}

-- Ctrl + f - Search in project
vim.api.nvim_set_keymap(
  'n',
  '<C-f>',
  ':Lack! ' .. vim.fn.expand("<cword>"),
  noremap_opt
)

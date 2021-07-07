-- In Normal Mode
-- Press \q to Enable and then f to see highlights and jump forward
vim.api.nvim_set_keymap('n', '<leader>q', '<Plug>(QuickScopeToggle)', { noremap = true })
-- In Terminal Mode
vim.api.nvim_set_keymap('x', '<leader>q', '<Plug>(QuickScopeToggle)', { noremap = true })

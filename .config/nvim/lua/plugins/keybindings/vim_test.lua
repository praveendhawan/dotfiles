local silent_opt = { silent = true }

vim.api.nvim_set_keymap('n', 'tn', ':TestNearest<cr>', silent_opt)
vim.api.nvim_set_keymap('n', 'tf', ':TestFile<cr>', silent_opt)
vim.api.nvim_set_keymap('n', 'ta', ':TestSuite<cr>', silent_opt)
vim.api.nvim_set_keymap('n', 'tl', ':TestLast<cr>', silent_opt)
vim.api.nvim_set_keymap('n', 'tv', ':TestVisit<cr>', silent_opt)

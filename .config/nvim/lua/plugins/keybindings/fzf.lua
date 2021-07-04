local noremap_opt = { noremap = true }

-- Ctrl + p to open fzf finder in Normal Mode
vim.api.nvim_set_keymap('n', '<C-p>', ':<C-u>FZF --reverse<cr>', noremap_opt)

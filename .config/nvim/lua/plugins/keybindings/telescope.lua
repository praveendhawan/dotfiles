local noremap_silent_opt = { noremap = true, silent = true}

-- Use Telescope Instead of FZF
-- Ctrl + p
vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>lua require("telescope.builtin").find_files()<cr>', noremap_silent_opt)
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<cr>', noremap_silent_opt)
vim.api.nvim_set_keymap('n', '<C-f>', '<cmd>lua require("telescope.builtin").live_grep()<cr>', noremap_silent_opt)
vim.api.nvim_set_keymap('n', '<leader>b', '<cmd>lua require("telescope.builtin").buffers()<cr>', noremap_silent_opt)
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>', noremap_silent_opt)
vim.api.nvim_set_keymap('n', '<leader>*', '<cmd>lua require("telescope.builtin").grep_string()<cr>', noremap_silent_opt)
vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>lua require("telescope.builtin").treesitter()<cr>', noremap_silent_opt)
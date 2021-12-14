local noremap = { noremap = true }

vim.api.nvim_set_keymap('n', '<leader>haa', "<cmd> lua require('harpoon.marks').add_file()<cr>", noremap)
-- Currently assigned to Gitsigns unstage hunk
-- vim.api.nvim_set_keymap('n', '<leader>hu', "<cmd> lua require('harpoon.ui').toggle_quick_menu()<cr>", noremap)
vim.api.nvim_set_keymap('n', '<leader>hnn', "<cmd> lua require('harpoon.ui').nav_next()<cr>", noremap)
vim.api.nvim_set_keymap('n', '<leader>hpp', "<cmd> lua require('harpoon.ui').nav_prev()<cr>", noremap)


vim.api.nvim_set_keymap('n', '<leader>h', '', { callback = require('harpoon.mark').add_file, desc = 'Add file to harpoon' })
-- Currently assigned to Gitsigns unstage hunk
-- vim.api.nvim_set_keymap('n', '<leader>hu', "<cmd> lua require('harpoon.ui').toggle_quick_menu()<cr>", noremap)
vim.api.nvim_set_keymap('n', '<leader>hnn', '', { callback = require('harpoon.ui').nav_next })
vim.api.nvim_set_keymap('n', '<leader>hpp', '', { callback = require('harpoon.ui').nav_prev })


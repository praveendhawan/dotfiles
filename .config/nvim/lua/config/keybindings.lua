local silent_noremap_opt = { noremap = true, silent = true }
local noremap_opt = { noremap = true }

-- Pressing fn + F5 will show the buffers list in current worksapce
-- vim.api.nvim_set_keymap('n', '<F5>', ':buffers<cr>:buffer<Space>', noremap_opt)

-- Press \l to toggle visibility of invisible characters (listchars)
vim.api.nvim_set_keymap('n', '<leader>l', ':set list!<cr>', noremap_opt)
-- options to choose from
vim.api.nvim_set_keymap('n', '<C-]>', 'g<C-]>', noremap_opt)

-- Copy Full File path to system clipboard
vim.api.nvim_set_keymap('n', '<leader>cf', ':let @+=expand("%:p")<cr>', noremap_opt)
-- Copy FIle path relative to current directory
vim.api.nvim_set_keymap('n', '<leader>cr', ':let @+=expand("%:p:.")<cr>', noremap_opt)
-- Copy just file name to system clipboard
vim.api.nvim_set_keymap('n', '<leader>cl', ':let @+=expand("%:t")<cr>', noremap_opt)

-- Better Indenting
vim.api.nvim_set_keymap('v', '<', '<gv', silent_noremap_opt)
vim.api.nvim_set_keymap('v', '>', '>gv', silent_noremap_opt)

-- Visual Mode Move Lines Up and Down
vim.api.nvim_set_keymap('x', 'K', ":move '<-2<cr>gv-gv'", silent_noremap_opt)
vim.api.nvim_set_keymap('x', 'J', ":move '>+1<cr>gv-gv'", silent_noremap_opt)

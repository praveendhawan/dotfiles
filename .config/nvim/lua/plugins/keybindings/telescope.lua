local noremap_silent_opt = { noremap = true, silent = true}

-- Use Telescope Instead of FZF
-- Ctrl + p
vim.api.nvim_set_keymap(
  'n',
  '<C-p>',
  '<cmd>lua require("telescope.builtin").find_files(require("telescope.themes").get_dropdown({}))<cr>',
  noremap_silent_opt
)
-- \af For finding something in current buffer
vim.api.nvim_set_keymap(
  'n',
  '<leader>af',
  '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({}))<cr>',
  noremap_silent_opt
)
-- \g for live grep with preview
vim.api.nvim_set_keymap(
  'n',
  '<leader>g',
  '<cmd>lua require("telescope.builtin").live_grep(require("telescope.themes").get_dropdown({}))<cr>',
  noremap_silent_opt
)
-- \b for switching to buffers
vim.api.nvim_set_keymap(
  'n',
  '<leader>b',
  '<cmd>lua require("telescope.builtin").buffers(require("telescope.themes").get_dropdown({}))<cr>',
  noremap_silent_opt
)
-- \fh for help tags
vim.api.nvim_set_keymap(
  'n',
  '<leader>fh',
  '<cmd>lua require("telescope.builtin").help_tags()<cr>',
  noremap_silent_opt
)
-- Ctrl + f - Search in project
vim.api.nvim_set_keymap(
  'n',
  '<C-f>',
  '<cmd>lua require("telescope.builtin").grep_string(require("telescope.themes").get_dropdown({}))<cr>',
  noremap_silent_opt
)
-- \t Treesitter symbols list of current buffer
vim.api.nvim_set_keymap(
'n',
'<leader>t',
'<cmd>lua require("telescope.builtin").treesitter()<cr>',
noremap_silent_opt
)

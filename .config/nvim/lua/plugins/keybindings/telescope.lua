local noremap_silent_opt = { noremap = true, silent = true}

-- Use Telescope Instead of FZF
-- Ctrl + p
vim.api.nvim_set_keymap(
  'n',
  '<C-p>',
  "<cmd>lua require('telescope').extensions.fzf_writer.files(require('telescope.themes').get_dropdown({ preview = false }))<cr>",
  noremap_silent_opt
)
-- \af For finding something in current buffer
vim.api.nvim_set_keymap(
  'n',
  '<leader>af',
  '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<cr>',
  noremap_silent_opt
)
-- \g for live grep with preview
vim.api.nvim_set_keymap(
  'n',
  '<leader>gf',
  '<cmd>lua require("telescope.builtin").live_grep()<cr>',
  noremap_silent_opt
)
-- \b for switching to buffers
vim.api.nvim_set_keymap(
  'n',
  '<leader>b',
  '<cmd>lua require("telescope.builtin").buffers()<cr>',
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
  '<cmd>lua require("telescope.builtin").grep_string()<cr>',
  noremap_silent_opt
)
-- \t Treesitter symbols list of current buffer
vim.api.nvim_set_keymap(
'n',
'<leader>t',
'<cmd>lua require("telescope.builtin").treesitter()<cr>',
noremap_silent_opt
)

-- \t Treesitter symbols list of current buffer
vim.api.nvim_set_keymap(
'n',
'<leader>k',
'<cmd>lua require("telescope.builtin").keymaps()<cr>',
noremap_silent_opt
)

-- \gl Lists git commits with diff preview
vim.api.nvim_set_keymap(
'n',
'<leader>gl',
'<cmd>lua require("telescope.builtin").git_commits()<cr>',
noremap_silent_opt
)

-- \gb Lists git commits with diff preview for the buffer
vim.api.nvim_set_keymap(
'n',
'<leader>gbl',
'<cmd>lua require("telescope.builtin").git_bcommits()<cr>',
noremap_silent_opt
)

-- \gbr Lists all branches with log preview
vim.api.nvim_set_keymap(
'n',
'<leader>gbr',
'<cmd>lua require("telescope.builtin").git_bcommits()<cr>',
noremap_silent_opt
)


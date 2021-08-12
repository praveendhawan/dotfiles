local noremap_silent_opt = { noremap = true, silent = true}
local actions = require('telescope.actions')

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        -- Use esc to close telescope
        -- otherwise need to press esc 2 times,
        -- one to go to normal mode and other to close
        ["<esc>"] = actions.close,
        -- Use Location list instead of quickfix List
        ["<C-q>"] = actions.smart_send_to_loclist + actions.open_loclist
      },
      n = {
        -- Use Location list instead of quickfix List
        ["<C-q>"] = actions.smart_send_to_loclist + actions.open_loclist
      }
    }
  }
}

-- Use Telescope Instead of FZF
-- Ctrl + p
vim.api.nvim_set_keymap(
  'n',
  '<C-p>',
  "<cmd>lua require('telescope').extensions.fzf_writer.files(require('telescope.themes').get_dropdown({ preview = false }))<cr>",
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
'<cmd>lua require("telescope.builtin").git_branches()<cr>',
noremap_silent_opt
)


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
-- vim.api.nvim_set_keymap(
--   'n',
--   '<C-p>',
--   "<cmd>lua require('telescope').extensions.fzf_writer.files(require('telescope.themes').get_dropdown({ preview = false }))<cr>",
--   noremap_silent_opt
-- )
vim.api.nvim_set_keymap(
  'n',
  '<C-p>',
  "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ preview = false }))<cr>",
  noremap_silent_opt
)
-- \fb for switching to buffers
vim.api.nvim_set_keymap(
  'n',
  '<leader>fb',
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
-- \ft Treesitter symbols list of current buffer
vim.api.nvim_set_keymap(
'n',
'<leader>ft',
'<cmd>lua require("telescope.builtin").treesitter()<cr>',
noremap_silent_opt
)

-- \fk Treesitter symbols list of current buffer
vim.api.nvim_set_keymap(
'n',
'<leader>fk',
'<cmd>lua require("telescope.builtin").keymaps()<cr>',
noremap_silent_opt
)

-- \fg Lists git commits with diff preview
vim.api.nvim_set_keymap(
'n',
'<leader>fgc',
'<cmd>lua require("telescope.builtin").git_commits()<cr>',
noremap_silent_opt
)

-- \fgc Lists git commits with diff preview for the buffer
vim.api.nvim_set_keymap(
'n',
'<leader>fgbc',
'<cmd>lua require("telescope.builtin").git_bcommits()<cr>',
noremap_silent_opt
)

-- \fgb Lists all branches with log preview
vim.api.nvim_set_keymap(
'n',
'<leader>fgb',
'<cmd>lua require("telescope.builtin").git_branches()<cr>',
noremap_silent_opt
)


-- \fp Lists all projects
vim.api.nvim_set_keymap(
'n',
'<leader>fp',
'<cmd>lua require("telescope").extensions.project.project({ display_type = "full" })<cr>',
noremap_silent_opt
)

function smart_search_dash()
  local current_word = vim.fn.expand("<cword>")
  if current_word then
    local key = vim.api.nvim_replace_termcodes(":Dash " .. current_word, true, true, true)
    vim.api.nvim_feedkeys(key, 't', true)
  else
    local key = vim.api.nvim_replace_termcodes(":Dash ", true, true, true)
    vim.api.nvim_feedkeys(key, 't', true)
  end
end

-- \fd Search in dash for documentation
vim.api.nvim_set_keymap(
  'n',
  '<leader>fd',
  ':lua smart_search_dash()<CR>',
  noremap_silent_opt
)

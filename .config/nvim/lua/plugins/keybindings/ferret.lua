local noremap_opt = { noremap = true }


function smart_search()
  local current_word = vim.fn.expand("<cword>")
  if current_word then
    local key = vim.api.nvim_replace_termcodes(":Lack! " .. current_word, true, true, true)
    vim.api.nvim_feedkeys(key, 't', true)
  else
    local key = vim.api.nvim_replace_termcodes(":Lack! ", true, true, true)
    vim.api.nvim_feedkeys(key, 't', true)
  end
end

-- Ctrl + f - Search in project
vim.api.nvim_set_keymap(
  'n',
  '<C-f>',
  ':lua smart_search()<CR>',
  noremap_opt
)

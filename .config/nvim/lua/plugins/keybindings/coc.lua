local no_opt = {}
local silent_opt = { silent = true }
local noremap_opt = { noremap = true }
local noremap_silent_opt = { noremap = true, silent = true }

-- Jump Mappings
vim.cmd([[
nmap <silent> gd <Plug>(coc-definition) :<C-u>call CocActionAsync('jumpDefinition')<CR>

nmap <silent> gy <Plug>(coc-type-definition) :<C-u>call CocActionAsync('jumpTypeDefinition')<CR>

nmap <silent> gi <Plug>(coc-implementation) :<C-u>call CocActionAsync('jumpImplementation')<CR>

nmap <silent> gr <Plug>(coc-references) :<C-u>call CocActionAsync('jumpReferences')<CR>
]])

-- Information
-- Lua smart show doc function
function show_documentation()
  local filetype = vim.bo.filetype
  if filetype == "vim" or filetype == "help" then
    vim.api.nvim_command("h " .. vim.fn.expand("<cword>"))
  elseif vim.fn["coc#rpc#ready"]() then
    vim.fn.CocActionAsync("doHover")
  else
    vim.api.nvim_command(
      "!" .. vim.bo.keywordprg .. " " .. vim.fn.expand("<cword>")
    )
  end
end

vim.api.nvim_set_keymap('n', 'K', '<cmd>lua show_documentation()<cr>', noremap_silent_opt)

-- Code Actions
-- Rename
vim.api.nvim_set_keymap('n', '<leader>rn', '<Plug>(coc-rename)', no_opt)

-- Formatting
vim.api.nvim_set_keymap('n', '<leader>f', '<Plug>(coc-format-selected)', no_opt)

vim.api.nvim_set_keymap('x', '<leader>f', '<Plug>(coc-format-selected)', no_opt)

-- QuickFix (Linting)
vim.api.nvim_set_keymap('n', '<leader>qf', '<Plug>(coc-fix-current)', no_opt)

-- Snippets Expansions And Selection
vim.api.nvim_set_keymap('i', '<C-l>', '<Plug>(coc-snippets-expand)', no_opt)
vim.api.nvim_set_keymap('v', '<C-j>', '<Plug>(coc-snippets-select)', no_opt)

vim.api.nvim_set_keymap('n', 'H', ':call CocActionAsync("highlight")<cr>', noremap_silent_opt)

-- Find Symbols of current doc
vim.api.nvim_set_keymap('n', '<space>o', ':<C-u>CocList outline<cr>', noremap_silent_opt)

-- Find Symbols of current workspace
vim.api.nvim_set_keymap('n', '<space>o', ':<C-u>CocList -I symbols<cr>', noremap_silent_opt)


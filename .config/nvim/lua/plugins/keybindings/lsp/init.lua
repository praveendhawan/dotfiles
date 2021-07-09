local noremap_silent_opt = { noremap = true, silent = true }

local function set_keymap(...)
  vim.api.nvim_set_keymap('n', ...)
end

-- Jump Mappings
set_keymap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>', noremap_silent_opt)

set_keymap('gy', '<cmd>lua vim.lsp.buf.declaration()<CR>', noremap_silent_opt)

set_keymap('gr', '<cmd>lua vim.lsp.buf.references()<CR>', noremap_silent_opt)

set_keymap('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', noremap_silent_opt)

-- Information
set_keymap('K', '<cmd>lua vim.lsp.buf.hover()<CR>', noremap_silent_opt)
set_keymap('<C-k>', '<cmd>lua vim.lsp.buf.hover()<CR>', noremap_silent_opt)
-- Code Actions
-- Rename
set_keymap('<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', noremap_silent_opt)


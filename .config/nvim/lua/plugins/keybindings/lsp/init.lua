local noremap_silent_opt = { noremap = true, silent = true }

local function set_keymap(...)
  vim.api.nvim_set_keymap('n', ...)
end

-- Jump Mappings
set_keymap('gd', '', { callback = vim.lsp.buf.definition })

set_keymap('gy', '', { callback = vim.lsp.buf.declaration })

set_keymap('gr', '', { callback = vim.lsp.buf.references })

set_keymap('gi', '', { callback = vim.lsp.buf.implementation })

-- Information
set_keymap('K', '', { callback = vim.lsp.buf.hover })
set_keymap('<C-k>', '', { callback = vim.lsp.buf.hover })
-- Code Actions
-- Rename
set_keymap('<leader>rn', '', { callback = vim.lsp.buf.rename })


local function set_keymap(...)
  vim.api.nvim_set_keymap('n', ...)
end

-- Jump Mappings
set_keymap('gd', '', { callback = vim.lsp.buf.definition, desc = 'Jump to definition' })

set_keymap('gy', '', { callback = vim.lsp.buf.declaration, desc = 'Jump to declaration' })

set_keymap('gr', '', { callback = vim.lsp.buf.references, desc = 'Jump to references' })

set_keymap('gi', '', { callback = vim.lsp.buf.implementation, desc = 'Jump to implementation' })

-- Information
set_keymap('K', '', { callback = vim.lsp.buf.hover, desc = 'Show hover information - Docs' })
set_keymap('<C-k>', '', { callback = vim.lsp.buf.hover, desc = 'Show hover information - Docs' })
-- Code Actions
-- Rename
set_keymap('<leader>rn', '', { callback = vim.lsp.buf.rename, desc = 'Rename symbol' })


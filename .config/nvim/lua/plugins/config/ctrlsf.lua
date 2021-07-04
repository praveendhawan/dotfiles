-- Use rg for search
vim.g.ctrlsf_backend = 'rg'
-- Allow to feed search results to quickfix lists
vim.g.ctrlsf_populate_qflist = 1
vim.g.ctrlsf_indent = 2

-- Use async for search mode
vim.g.ctrlsf_search_mode = 'async'

-- Compact mode for showing search results
vim.g.ctrlsf_default_view_mode = 'compact'

-- Extra args to rg
vim.g.ctrlsf_extra_backend_args = {
  rg = '-H --no-heading --smart-case'
}

-- Autofocus to search result pane at the start of search
vim.g.ctrlsf_auto_focus = {
  at = 'start'
}

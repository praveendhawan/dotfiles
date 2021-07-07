vim.g.ale_linters = {
  ruby = { 'rubocop', 'rufo' },
  javascript = { 'eslint' },
  css = { 'stylelint' }
}

vim.g.ale_fixers = {
  ruby = { 'rubocop', 'rufo' },
  javascript = { 'eslint' }
}

vim.g.ale_fix_on_save = 0
vim.g.ale_sign_column_always = 1
vim.g.ale_sign_error = '✗'
vim.g.ale_sign_warning = '⚠'
vim.g.ale_sign_hint = '!'
vim.g.ale_sign_info = '◆'
vim.g.ale_lint_on_text_changed = 'never'
vim.g.ale_lint_on_insert_leave = 0
-- You can disable this option too
-- if you don't want linters to run on opening a file
vim.g.le_lint_on_enter = 0
vim.g.ale_set_loclist = 0
vim.g.ale_set_quickfix = 1

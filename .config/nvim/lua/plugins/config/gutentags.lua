-- set ctags directory to be used by nvim
vim.cmd[[set tags=./tags,tags;$HOME]]

vim.cmd([[
if executable('ripper-tags')
  let g:gutentags_ctags_executable_ruby = 'ripper-tags'
  let g:gutentags_ctags_extra_args = ['--ignore-unsupported-options', '--recursive']
endif
]])

vim.g.gutentags_ctags_exclude = {
  '*.git',
  '*.md',
  '*.sql',
  '*/config/routes/dekeo.rb',
  '*/config/routes/dekeo_wildcard.rb',
  '*/config/routes/ratemydecorator.rb',
  '.sass-cache',
  '.vagrant',
  'CODEOWNERS',
  'build',
  'crates/*',
  'db/migrate/*',
  'db/support/*',
  'doc',
  'docs',
  'fixtures/*',
  'log',
  'node_modules',
  'public/assets',
  'public/packs',
  'spec/*',
  'storage',
  'tags*',
  'vendor'
}

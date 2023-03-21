vim.cmd([[
if has('nvim')
  let test#strategy='neovim'
else
  let test#strategy='vimterminal'
endif

let test#ruby#rspec#executable='bundle exec spring rspec'
]])

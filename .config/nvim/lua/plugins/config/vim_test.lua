vim.cmd([[
if has('nvim')
  let test#strategy='neovim'
else
  let test#strategy='vimterminal'
endif

let test#ruby#rspec#executable='docker compose -f docker-compose.yml exec -e COLUMNS=jd_stty_cols -e LINES=jd_stty_rows spring bundle exec spring rspec'
]])

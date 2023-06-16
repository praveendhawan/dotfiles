-- Auto commads to copy to system clipboard using oscyank after + and * registers used
local api = vim.api

-- Augroup for * register
local yankPostStarGroup = api.nvim_create_augroup("YankPostStarGroup", { clear = true })
-- Augroup for + register
local yankPostPlusGroup = api.nvim_create_augroup("YankPostPlusGroup", { clear = true })

-- Autocommand for * register
api.nvim_create_autocmd("TextYankPost", {
  command = [[
    if v:event.operator is 'y' && v:event.regname is '*'
      execute 'OSCYankRegister *'
    endif
  ]],
  group = yankPostStarGroup,
})

-- Autocommand for + register
api.nvim_create_autocmd("TextYankPost", {
  command = [[
    if v:event.operator is 'y' && v:event.regname is '+'
      execute 'OSCYankRegister +'
    endif
  ]],
  group = yankPostPlusGroup,
})

-- Set oscyank term otherwise the char limit is 120 for copying to clipboard in tmux
-- https://github.com/ojroques/vim-oscyank#the-plugin-does-not-work-with-tmux
vim.g.oscyank_term = 'default'

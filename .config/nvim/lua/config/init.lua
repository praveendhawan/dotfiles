-- Super Configurations

vim.cmd[[filetype plugin indent off]]
vim.cmd[[syntax off]]

-- Enable Tab completion in commands
vim.o.wildmenu = true

-- Colorscheme for vim
-- vim.cmd[[colorscheme default]]

-- https://apple.stackexchange.com/questions/266034/iterm2-applies-strange-color-to-vims-default
vim.o.termguicolors = true
vim.o.background = 'dark'

-- invisible characters symbols
vim.cmd[[set lcs=tab:▸\ ,eol:¬ ]]
-- vim.opt.listchars = { tab = '▸', eol = '¬' }

-- show invisible characters by default
vim.o.list = true

-- spaces instead of tabs
-- tabstop - how many columns a tab counts for
-- shiftwidth - how many columns text is indeneted
-- expandtab - convert tabs to spaces
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- show line numbers
vim.o.number = true

-- Highlight current line
vim.o.cursorline = true

-- Allow opening of new buffers when current buffer have unsaved changes
-- This will hide the current buffer instead of closing it
vim.o.hidden = true

-- Always show the signcolum, otherwise it would shift the text each time changes appear/disappear
vim.o.signcolumn = 'yes'

--  auto load file if its changed outside of vim
vim.cmd[[set autoread]]

-- Do not display current mode (use statusline for it)
vim.o.showmode = false

-- ignore case when searching
vim.o.ignorecase = true

-- ignore case if search pattern is all lowercase,
-- case-sensitive otherwise
vim.o.smartcase = true

-- show search matches as you type
vim.o.incsearch = true

-- treat -(Dash) _(Underscore) as part of word
-- treat !(Bang) and ?(Question Mark) as keyword for Ruby files
vim.api.nvim_exec([[
  set iskeyword+=-,_
  augroup rubyKeywords
    autocmd! FileType ruby,eruby set iskeyword+=!,?
  augroup end
]], false)

--Enable mouse mode
vim.o.mouse = "a"

--Decrease update time
vim.o.updatetime = 100

--  Show Tabline to show buffer name on top
--  Handled by bufferline plugin
-- vim.o.showtabline = 2

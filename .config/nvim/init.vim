lua << EOF
-- Nvim Config
require('config')
-- Nvim Keybindings Overrides
require('config.keybindings')
require('config.external_commands_keybindings')
-- List of Plugins
require('plugins')
-- Plugins Config
require('plugins.config.ale')
require('plugins.config.bufferline')
require('plugins.config.coc')
require('plugins.config.gutentags')
require('plugins.config.lualine')
require('plugins.config.matchup')
require('plugins.config.nvim_tree')
require('plugins.config.nvim_web_devicons')
require('plugins.config.quick_scope')
require('plugins.config.scratch')
require('plugins.config.seti')
require('plugins.config.splitjoin')
require('plugins.config.telescope')
require('plugins.config.vim_test')
-- Plugings Keybindings
require('plugins.keybindings.coc')
require('plugins.keybindings.quick_scope')
require('plugins.keybindings.nvim_tree')
require('plugins.keybindings.telescope')
require('plugins.keybindings.vim_test')
require('plugins.keybindings.whichkey')
-- TreeSitter
require('treesitter.syntax_highlight')
require('treesitter.incremental_selection')
require('treesitter.indentation')
require('treesitter.playground')
require('treesitter.textobjects')
require('treesitter.context')
require('treesitter.matchup')
EOF

" My custom commands
source ~/.config/nvim/custom_commands.vim

" My custom functions list
for f in split(glob('~/.config/nvim/functions/*.vim'), '\n')
    exe 'source' f
endfor

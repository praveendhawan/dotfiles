" Plugins and keymaps and vim configurarions

" Default Config Files for vim
source ~/.config/nvim/super_config_vimrc
" Configs I want to override
source ~/.config/nvim/config_vimrc

" Plugins I want to install
" source ~/.config/nvim/plugins.vim
" Plugings now in Lua
lua << EOF
require('plugins')
EOF

" Config I want to write for vim using Plugins - commands
source ~/.config/nvim/plugins_config.vim

" Default Keymaps I want to override (which comes with vim)
source ~/.config/nvim/keymap.vim
" Keymaps I want to override (which comes with plugins)
source ~/.config/nvim/plugins_keymaps.vim

" My custom commands
source ~/.config/nvim/custom_commands.vim

" My custom functions list
for f in split(glob('~/.config/nvim/functions/*.vim'), '\n')
    exe 'source' f
endfor

" Lua File
" TreeSitter
lua << EOF
require('treesitter.syntax_highlight')
require('treesitter.incremental_selection')
require('treesitter.indentation')
require('treesitter.playground')
require('treesitter.textobjects')
require('treesitter.context')
require('treesitter.matchup')
EOF

lua << EOF
local config = require('config_file')
config.load()
EOF

" My custom commands
source ~/.config/nvim/custom_commands.vim

" My custom functions list
for f in split(glob('~/.config/nvim/functions/*.vim'), '\n')
    exe 'source' f
endfor

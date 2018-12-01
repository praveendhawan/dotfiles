" commands and configurtions for plugins goes here

" Plugin Install using minpac
command! PackUpdate call minpac#update()

" Plugin Uninstall using minpac
command! PackClean call minpac#clean()


" This will enable powerline fonts in vim
let g:airline_powerline_fonts = 1

" Set airline theme
" let g:airline_theme='dark_minimal'

let g:airline_theme='cool'


" Show buffers as tabs on top
let g:airline#extensions#tabline#enabled = 1
" remove buffers from tabline after they are deleted
autocmd BufDelete * call airline#extensions#tabline#buflist#invalidate()

" Ale Setup
" linters for different types of files
let g:ale_linters = {
\  'javascript': ['eslint'],
\  'ruby': ['rubocop'],
\  'elixir': ['credo']
\}

" Vim Grepper plugin configurations
let g:grepper = {}
let g:grepper.rg = {
\  'grepprg': 'rg -H --no-heading --smart-case --vimgrep',
\  'grepformat':  '%f:%l:%m',
\  'escape': '\+*^$()[]'
\ }

let g:grepper.tools = ['rg', 'grep', 'git']

" custom highlight for ale warnings and errors
" highlight ALEWarning term=inverse,bold cterm=bold ctermbg=darkred ctermfg=white gui=bold guibg=darkred guifg=white
" highlight ALEError term=inverse,bold cterm=bold ctermbg=darkgreen ctermfg=white gui=bold guibg=darkgreen guifg=white

" show linting error/warnings in airline status bar
let g:airline#extensions#ale#enabled = 1

" Vim Ruby Config
" Ruby: Operator highlighting
let ruby_operators = 1
" Ruby: Whitespace errors
let ruby_space_errors = 1
" Ruby: Folding
" let ruby_fold = 1

" Vim Gutentags config
if executable('ripper-tags') && executable('ripper-tags-wrapper')
  let g:gutentags_ctags_executable_ruby = 'rtags'
else
" TODO: Make it work
"  git clone git@gist.github.com:9c3ddd7eb9be3227066980951afe7671.git
"  mv rtags /usr/local/bin
"  chmod +x /usr/local/bin/rtags
"  let g:gutentags_ctags_executable_ruby = 'rtags'
endif

set statusline+=%{gutentags#statusline()}
let g:gutentags_ctags_exclude = ['./config/routes/dekeo_wildcard.rb', './config/routes/dekeo.rb', 'build', 'vendor', '.git', 'node_modules', '.sass-cache', '.vagrant', 'docs', 'log']

" Use deoplete - Autocomplete Framework
let g:deoplete#enable_at_startup = 1

" Solarized Dark Theme
" set background=dark
"colorscheme solarized

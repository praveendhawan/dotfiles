" commands and configurtions for plugins goes here

" Plugin Install using minpac
command! PackUpdate call minpac#update()

" Plugin Uninstall using minpac
command! PackClean call minpac#clean()


" This will enable powerline fonts in vim
let g:airline_powerline_fonts = 1

" Set airline theme
" let g:airline_theme='dark_minimal'

let g:airline_theme='molokai'


" Show buffers as tabs on top
let g:airline#extensions#tabline#enabled = 1
" remove buffers from tabline after they are deleted
autocmd BufDelete * call airline#extensions#tabline#buflist#invalidate()

" Ale Setup
let g:ale_linters = {
\  'javascript': ['eslint'],
\  'ruby': ['rubocop'],
\  'elixir': ['credo']
\}

" Vim Ruby Config

" Ruby: Operator highlighting
let ruby_operators = 1
" Ruby: Whitespace errors
let ruby_space_errors = 1
" Ruby: Folding
let ruby_fold = 1

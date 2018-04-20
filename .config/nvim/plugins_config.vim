" commands and configurtions for plugins goes here

" Plugin Install using minpac
command! PackUpdate call minpac#update()

" Plugin Uninstall using minpac
command! PackClean call minpac#clean()


" This will enable powerline fonts in vim
let g:airline_powerline_fonts = 1

" Set airline theme
let g:airline_theme='sol'

" Ale Setup
let g:ale_linters = {
\  'javascript': ['eslint'],
\  'ruby': ['rubocop']
\}

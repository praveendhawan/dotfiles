" commands and configurtions for plugins goes here

" Plugin Install using minpac
command! PackUpdate call minpac#update()

" Plugin Uninstall using minpac
command! PackClean call minpac#clean()


" This will enable powerline fonts in vim
let g:airline_powerline_fonts = 1

" Set airline theme
let g:airline_theme='dark_minimal'

" Open NERDTree on startup nvim
" autocmd vimenter * NERDTree

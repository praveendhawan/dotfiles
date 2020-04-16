" This file is used for mapping shortcuts for  vim plugins

" Ctrl + p to open fzf finder in Normal Mode
nnoremap <C-p> :<C-u>FZF<CR>

" Search for the current word
nnoremap <Leader>* :Grepper -cword -noprompt<CR>
nnoremap <C-f> :Grepper -tool rg -cword<CR>


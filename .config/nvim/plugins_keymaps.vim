" This file is used for mapping shortcuts for  vim plugins

" Bind Ctrl+n to open NERDTree
"map <C-n> :NERDTreeToggle<CR>

" Ctrl + p to open fzf finder in Normal Mode
nnoremap <C-p> :<C-u>FZF<CR>

" Mappings in the style of unimpaired-next
"nmap <silent> [W <Plug>(ale_first)
"nmap <silent> [w <Plug>(ale_previous)
"nmap <silent> ]w <Plug>(ale_next)
"nmap <silent> ]W <Plug>(ale_last)

" Vim Grepper plugin configurations
let g:grepper = {}
let g:grepper.tools = ['grep', 'git', 'rg']
" Search for the current word
nnoremap <Leader>* :Grepper -cword -noprompt<CR>
" Search for the current selection
" nmap gs <plug>(GrepperOperator)
" xmap gs <plug>(GrepperOperator)

" search shortcut - RipperGrep
" ctrl + f to grep using rg
" Fill the prompt with current word by default
" add -noprompt option to start search without hitting Enter key
" nnoremap <C-F> :Grepper -tool rg -cword -noprompt<CR>
nnoremap <C-f> :Grepper -tool rg -cword<CR>

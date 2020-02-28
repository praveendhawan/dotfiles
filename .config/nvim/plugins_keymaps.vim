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

" COC KEYMAPPINGS
"
" Remap keys for gotos
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
"nnoremap <silent> K :call <SID>show_documentation()<CR>

"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction

" Highlight symbol under cursor on CursorHold
"autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
"nmap <leader>rn <Plug>(coc-rename)


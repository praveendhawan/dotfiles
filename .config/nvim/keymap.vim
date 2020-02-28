" Pressing fn + F5 will show the buffers list in current worksapce
:nnoremap <F5> :buffers<CR>:buffer<Space>
" Press \l to toggle visibility of invisible characters (listchars)
:nmap <leader>l :set list!<CR>
" Press Esc to exit termianl Mode
" tnoremap <Esc> <C-\><C-n>
" Now We can't send Esc to terminal, to do that - Press Ctrl + v and then Esc
" :tnoremap <C-v><Esc> <Esc>
" When there are more than one match found with the tag, this will show
" options to choose from.
:nnoremap <C-]> g<C-]>

" COC KEYMAPPINGS
"
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)


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

" Copy Full file path to system clipboard
:nmap ,cf :let @+=expand("%:p")<CR>
" Copy File path relative to current directory
:nmap ,cr :let @+=expand("%:p:.")<CR>
" Copy jusy the file name to system clipboard
:nmap ,cl :let @+=expand("%:t")<CR>


" Pressing F5 will show the buffers list in current worksapce
:nnoremap <F5> :buffers<CR>:buffer<Space>
" Press \l to toggle visibility of invisible characters (listchars)
:nmap <leader>l :set list!<CR>
" Press Esc to exit termianl Mode
tnoremap <Esc> <C-\><C-n>
"Now We can't send Esc to terminal, to do that - Press Ctrl + v and then Esc
tnoremap <C-v><Esc> <Esc>

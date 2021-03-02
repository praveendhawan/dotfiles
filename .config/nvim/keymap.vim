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
:nmap <leader>cf :let @+=expand("%:p")<CR>
" Copy File path relative to current directory
:nmap <leader>cr :let @+=expand("%:p:.")<CR>
" Copy jusy the file name to system clipboard
:nmap <leader>cl :let @+=expand("%:t")<CR>

" Terminal Mode keybindings
tnoremap <C-q> <C-\><C-n>
" tnoremap <C-v><Esc> <Esc>

" ===== Seeing Is Believing =====
" Assumes you have a Ruby with SiB available in the PATH
" If it doesn't work, you may need to `gem install seeing_is_believing`
"
" Annotate every line
nmap <leader>b :%!seeing_is_believing --timeout 12 --line-length 500 --number-of-captures 300 --alignment-strategy chunk<CR>;

" Annotate marked lines
nmap <leader>n :%.!seeing_is_believing --timeout 12 --line-length 500 --number-of-captures 300 --alignment-strategy chunk --xmpfilter-style<CR>;

" Remove annotations
nmap <leader>c :%.!seeing_is_believing --clean<CR>;

" Mark the current line for annotation
nmap <leader>m A # => <Esc>

" Mark the highlighted lines for annotation
vmap <leader>m :norm A # => <Esc>

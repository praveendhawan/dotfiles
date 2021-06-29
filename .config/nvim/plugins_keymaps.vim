" This file is used for mapping shortcuts for  vim plugins

" Ctrl + p to open fzf finder in Normal Mode
nnoremap <C-p> :<C-u>FZF  --reverse<CR>

" Search for the current word
"nnoremap <Leader>* :Grepper -cword -noprompt<CR>
"nnoremap <C-f> :Grepper -tool rg -cword<CR>
"nnoremap <Leader>* :Rg -cword<CR>
"nnoremap <C-f> :Rg -cword<CR>

nmap <Leader>* <Plug>CtrlSFVwordExec
nmap <C-f> <Plug>CtrlSFCCwordPath

" Kep mappings
let g:ctrlsf_mapping = {
\ "popen":  "P",
\ "popenf": "p",
\ "next":   "n",
\ "prev":   "N"
\ }


" Which key
nnoremap <silent> <leader> :WhichKey '<leader>'<CR>

" SplitJoin keymappings
nmap <Leader>j :SplitjoinJoin<cr>
nmap <Leader>s :SplitjoinSplit<cr>

" QuickScope
nmap <leader>q <plug>(QuickScopeToggle)
xmap <leader>q <plug>(QuickScopeToggle)

" Aerojump Config
nmap <Leader>ab <Plug>(AerojumpBolt)
nmap <Leader>aa <Plug>(AerojumpFromCursorBolt)

" COC KEYMAPPINGS
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition) :<C-u>call CocActionAsync('jumpDefinition')<CR>
nmap <silent> gy <Plug>(coc-type-definition) :<C-u>call CocActionAsync('jumpTypeDefinition')<CR>
nmap <silent> gi <Plug>(coc-implementation) :<C-u>call CocActionAsync('jumpImplementation')<CR>
nmap <silent> gr <Plug>(coc-references) :<C-u>call CocActionAsync('jumpReferences')<CR>

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Highlight the symbol and its references when holding the cursor.
" CursurHold Means not pressing anything untill the updatetime
" CursurHoldI Means not pressing anything untill the updatetime in Insert mode
nnoremap <silent> H :call CocActionAsync('highlight')<CR>

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Vista tagbars
nnoremap <silent> <Leader>b :<C-u>Vista!!<CR>

" Vim Test keymappings
nmap <silent> tn :TestNearest<CR>
nmap <silent> tf :TestFile<CR>
nmap <silent> ta :TestSuite<CR>
nmap <silent> tl :TestLast<CR>
nmap <silent> tv :TestVisit<CR>

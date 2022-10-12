function! ComponentTreeBuilder(file_name, bang)
  let l:component_folder = substitute(a:file_name, "frontend\/components\/", "", "")
  if !exists("g:ctree_command")
    let g:ctree_command = "ctree"
  endif

  " if !exists("g:open_command")
  "   if substitute(system('uname'), '\n', '', '') == "Darwin"
  "     let g:open_command = "open"
  "   else
  "     let g:open_command = "xdg-open"
  "   end
  " endif

  echo l:component_folder

  silent exe "!" . g:ctree_command . " " . l:component_folder
  " silent exe "!" . g:open_command . " " . "./tmp/result.html"
endfunction

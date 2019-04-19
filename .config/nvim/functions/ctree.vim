function! ComponentTreeBuilder(component_name, bang)
  if !exists("g:ctree_command")
    let g:ctree_command = "ctree"
  endif

  if !exists("g:open_command")
    if substitute(system('uname'), '\n', '', '') == "Darwin"
      let g:open_command = "open"
    else
      let g:open_command = "xdg-open"
    end
  endif

  silent exe "!" . g:ctree_command . " " . a:component_name
  silent exe "!" . g:open_command . " " . "./tmp/result.html"
endfunction

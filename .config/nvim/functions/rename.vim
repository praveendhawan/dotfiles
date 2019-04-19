" Taken Inspiration from - https://github.com/danro/rename.vim/blob/master/plugin/rename.vim
function! Rename(new_name, bang)
  " Absolute path to current file
  let l:current_file = expand("%:p")
  " Path of the directory in which the current_file is present
  " with a `/` in the last (it will be concatenated)
  let l:current_path = expand("%:h") . "/"

  " save file with new name
  " fnameescape - handle file names with spaces correctly
  silent! exe "saveas" . a:bang . " " . fnameescape(l:current_path . a:new_name)

  " deleting the old file
  let l:old_file = l:current_file
  let l:current_file = expand("%:p")

  if l:current_file !=# l:old_file && filewritable(l:current_file)
    silent exe "bd! " . fnameescape(l:old_file)
    if delete(l:old_file)
      echoerr "Could not delete " . l:old_file
    else
      silent exe "e " . fnameescape(l:current_file)
    endif
  endif
endfunction

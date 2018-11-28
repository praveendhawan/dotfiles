" This file contains my custom commands for vim
"
command! BufCloseAllExceptCurrent execute "%bd|e#|bd#"
ca bca BufCloseAllExceptCurrent

command! -nargs=* RenameFile :call Rename("<args>", "<bang>")
ca rename RenameFile

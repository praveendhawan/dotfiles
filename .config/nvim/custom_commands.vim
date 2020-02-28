" This file contains my custom commands for vim

command! BufCloseAllExceptCurrent execute "%bd|e#|bd#"
ca bca BufCloseAllExceptCurrent

command! BufCloseAll execute "%bufdo bd"
ca bda BufCloseAll

command! -nargs=* RenameFile :call Rename("<args>", "<bang>")
ca rename RenameFile

command! -nargs=* BuildComponentTree :call ComponentTreeBuilder("<args>", "<bang>")
ca build_ctree BuildComponentTree

command! CopyFileName execute "let @* = expand('%')"
ca cp_fn CopyFileName

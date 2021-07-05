" This file contains my custom commands for vim

command! BufCloseAllExceptCurrent execute "%bd|e#|bd#"
ca bca BufCloseAllExceptCurrent

command! BufCloseAll execute "%bufdo bd"
ca bda BufCloseAll

command! -nargs=* RenameFile :call Rename("<args>", "<bang>")
ca rename RenameFile

command! -nargs=* BuildComponentTree :call ComponentTreeBuilder(expand('%:p:.:h'), "<bang>")
ca ctree BuildComponentTree

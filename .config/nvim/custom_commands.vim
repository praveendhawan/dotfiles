" This file contains my custom commands for vim
"
command! BufCloseAllExceptCurrent execute "%bd|e#|bd#"
ca bca BufCloseAllExceptCurrent
" command BufCloseAllExceptCurrent! silent! execute "%bd|e#|bd#"
" ca bca! BufCloseAllExceptCurrent!

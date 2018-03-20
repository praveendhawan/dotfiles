" Package Managament with Minpac
packadd minpac


"-------------------------------------------------------------------------------------------
" Packges are added in ~/.config/nvim/pack/minpac directory
" opt - Optional plugins
" start - By default, minpac installs plugins to the this directory
"
" To install plugin run
"                       :call minpac#update()
" To unistall a plugin remove the corresponding line from here and run
"                       :call minpac#clean()
"
"-------------------------------------------------------------------------------------------

"init minpac
call minpac#init()

" Package mgmt with Minmac (Auto update itself)
call minpac#add('k-takata/minpac', {'type': 'opt'})

" complementary pairs of mappings
call minpac#add('tpope/vim-unimpaired')

" Fuzzy File Finder
" Activate it usinf :FZF command or ctrl + p in normal mode
call minpac#add('junegunn/fzf')

" granular project configuration using projections
" projections are specific triggers to browse files in specific directory
call minpac#add('tpope/vim-projectionist')

" Airline Fonts and themes
" Airline status bar etc
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')

" Git support for vim
" This ia also necessary for showing the branch in ailine status bar
call minpac#add('tpope/vim-fugitive')

" Fix trailing Whitespace and highlight whitespace
call minpac#add('bronson/vim-trailing-whitespace')

" git gutter in files
call minpac#add('airblade/vim-gitgutter')

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
" call minpac#add('tpope/vim-unimpaired')

" Fuzzy File Finder
" Activate it usinf :FZF command or ctrl + p in normal mode
call minpac#add('junegunn/fzf')

" granular project configuration using projections
" projections are specific triggers to browse files in specific directory
" call minpac#add('tpope/vim-projectionist')

" Airline Fonts and themes
" Airline status bar etc
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')

" Git support for vim
" This ia also necessary for showing the branch in airline status bar
call minpac#add('tpope/vim-fugitive')

" Fix trailing Whitespace and highlight whitespace
call minpac#add('bronson/vim-trailing-whitespace')

" git gutter in files
call minpac#add('airblade/vim-gitgutter')

" coffeescript support (syntax) etc.
call minpac#add('kchmck/vim-coffee-script')

" ale plugin for auto linting code
call minpac#add('w0rp/ale')

" to run grep asynchronously
call minpac#add('mhinz/vim-grepper')

" Ruby and Rails syntax highlight
call minpac#add('vim-ruby/vim-ruby')

" add 'end' to def, if, do etc.
call minpac#add('tpope/vim-endwise')

" Add support for scratch buffers
call minpac#add('vim-scripts/scratch.vim')

" ctags mgmt
call minpac#add('ludovicchabant/vim-gutentags')

" Autocomplete Framework
" call minpac#add('Shougo/deoplete.nvim')

" Indent guide
call minpac#add('Yggdroot/indentLine')

" Elixir Language Support
call minpac#add('elixir-editors/vim-elixir')
call minpac#add('slashmili/alchemist.vim')
" This formatter will only work in mix projects
call minpac#add('mhinz/vim-mix-format')

" parenthesizing made simple
call minpac#add('tpope/vim-surround')

" selecting ruby blocks made easy
call minpac#add('kana/vim-textobj-user')
call minpac#add('nelstrom/vim-textobj-rubyblock')

" running rspecs from vim
call minpac#add('thoughtbot/vim-rspec')

" New Autocomplete Framework
" Install Node and yarn first
" For ruby completion do - 'gem install solargraph'
" Then Install coc plugin - https://www.npmjs.com/package/coc-solargraph - ':CocInstall coc-solargraph'
" :call coc#util#install()
" :CocInstall coc-json coc-solargraph
call minpac#add('neoclide/coc.nvim', {'do': { -> coc#util#install()}})

" Dash support plugin for vim
" NOTE: Only works on mac as Dash is only on Mac
call minpac#add('rizzatti/dash.vim')

" Vue JS syntax
call minpac#add('posva/vim-vue')

" NeoSolarized theme for vimr
call minpac#add('iCyMind/NeoSolarized')

" Taming the quickfix window :)
call minpac#add('romainl/vim-qf')

" Kuroi colorscheme
call minpac#add('aonemd/kuroi.vim')

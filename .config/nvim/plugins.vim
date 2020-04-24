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

" Fuzzy File Finder
" Activate it usinf :FZF command or ctrl + p in normal mode
call minpac#add('junegunn/fzf')

" StatusLine
call minpac#add('itchyny/lightline.vim')
" Show buffer name and number is tabline
call minpac#add('mengelbrecht/lightline-bufferline')

" Git support for vim
" This ia also necessary for showing the branch in airline status bar
call minpac#add('tpope/vim-fugitive')
" Enables Gbrowse from Gblame
call minpac#add('tpope/vim-rhubarb')
" Gist posting
call minpac#add('mattn/gist-vim')
" Git gutter
call minpac#add('mhinz/vim-signify')

" Fix trailing Whitespace and highlight whitespace
call minpac#add('bronson/vim-trailing-whitespace')

" coffeescript support (syntax) etc.
call minpac#add('kchmck/vim-coffee-script')

" to run grep asynchronously
call minpac#add('mhinz/vim-grepper')

" add 'end' to def, if, do etc.
" call minpac#add('tpope/vim-endwise')

" Add support for scratch buffers
call minpac#add('mtth/scratch.vim')

" ctags mgmt
call minpac#add('ludovicchabant/vim-gutentags')

" Indent guide
call minpac#add('Yggdroot/indentLine')

" Elixir Language Support
" To Setup Elixir LS - https://bernheisel.com/blog/vim-elixir-ls-plug/
"call minpac#add('elixir-editors/vim-elixir')
"call minpac#add('slashmili/alchemist.vim')
" This formatter will only work in mix projects
"call minpac#add('mhinz/vim-mix-format')

" selecting ruby blocks made easy
call minpac#add('kana/vim-textobj-user')
"call minpac#add('nelstrom/vim-textobj-rubyblock')
call minpac#add('andymass/vim-matchup')

" New Autocomplete Framework
" Install Node and yarn first
" For ruby completion do - 'gem install solargraph'
" Then Install coc plugin - https://www.npmjs.com/package/coc-solargraph - ':CocInstall coc-solargraph'
" To Setup Elixir LS - https://bernheisel.com/blog/vim-elixir-ls-plug/
call minpac#add('neoclide/coc.nvim', {'branch': 'release'})
"call minpac#add('autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash ./install.sh' })
"call minpac#add('Shougo/deoplete.nvim')

" call minpac#add('natebosch/vim-lsc')
" call minpac#add('ajh17/VimCompletesMe')

" For Linting and Fixing
call minpac#add('dense-analysis/ale')
call minpac#add('maximbaz/lightline-ale')

" Dash support plugin for vim
" NOTE: Only works on mac as Dash is only on Mac
call minpac#add('rizzatti/dash.vim')

" Vue JS syntax
call minpac#add('posva/vim-vue')


" Taming the quickfix window :)
call minpac#add('romainl/vim-qf')

" Colorschemes for Vim
" NeoSolarized theme for vimr
"call minpac#add('iCyMind/NeoSolarized')
" Kuroi
call minpac#add('aonemd/kuroi.vim')
" Monokai
" call minpac#add('sickill/vim-monokai')
" Seti
call minpac#add('trusktr/seti.vim')

" Vader for vim script tests
call minpac#add('junegunn/vader.vim')

" quick scope for jumping to words in line
call minpac#add('unblevable/quick-scope')

" for getting keybindings
call minpac#add('liuchengxu/vim-which-key')

" switching between a single-line statement and a multi-line one
call minpac#add('andrewradev/splitjoin.vim')

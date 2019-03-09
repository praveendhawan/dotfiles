" commands and configurtions for plugins goes here

" Plugin Install using minpac
command! PackUpdate call minpac#update()

" Plugin Uninstall using minpac
command! PackClean call minpac#clean()


" This will enable powerline fonts in vim
let g:airline_powerline_fonts = 1

" Set airline theme
" let g:airline_theme='dark_minimal'

let g:airline_theme='cool'


" Show buffers as tabs on top
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" remove buffers from tabline after they are deleted
autocmd BufDelete * call airline#extensions#tabline#buflist#invalidate()

" Ale Setup
" linters for different types of files
let g:ale_linters = {
\  'javascript': ['eslint'],
\  'ruby': ['rubocop', 'ruby'],
\  'elixir': ['credo', 'mix']
\}

" Configure Ale Fixers - to fix files use :ALEFix
let g:ale_fixers = {
\  'javascript': ['eslint'],
\  'ruby': ['rubocop'],
\  'elixir': ['credo']
\}

" Automatically fix files on save
" let g:ale_fix_on_save = 1
" autocompletion via ale
" Add solargraph to ruby linters if you want to enable it
" let g:ale_completion_enabled = 1

" Vim Grepper plugin configurations
let g:grepper = {}
let g:grepper.rg = {
\  'grepprg': 'rg -H --no-heading --smart-case --vimgrep',
\  'grepformat':  '%f:%l:%m',
\  'escape': '\+*^$()[]'
\ }

let g:grepper.tools = ['rg', 'grep', 'git']

" custom highlight for ale warnings and errors
" highlight ALEWarning term=inverse,bold cterm=bold ctermbg=darkred ctermfg=white gui=bold guibg=darkred guifg=white
" highlight ALEError term=inverse,bold cterm=bold ctermbg=darkgreen ctermfg=white gui=bold guibg=darkgreen guifg=white

" show linting error/warnings in airline status bar
let g:airline#extensions#ale#enabled = 1

" Vim Ruby Config
" Ruby: Operator highlighting (not working)
" let ruby_operators = 1
" Ruby: Whitespace errors (not needed - rubocop enabled)
" let ruby_space_errors = 1
" Ruby: Folding
let ruby_fold = 1
" Add config for what should be foldable
let ruby_foldable_groups = 'def # if << %'
" Ruby: use same color as do/def etc for 'end' keyword
" NOTE: THIS DOES NOT WORKING WITH FOLDS
" let ruby_no_expensive = 1
" Ruby: completion
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_include_object = 1

" Vim Gutentags config
if executable('ripper-tags') && executable('ripper-tags-wrapper')
  let g:gutentags_ctags_executable_ruby = 'rtags'
else
" TODO: Make it work
"  git clone git@gist.github.com:9c3ddd7eb9be3227066980951afe7671.git
"  mv rtags /usr/local/bin
"  chmod +x /usr/local/bin/rtags
"  let g:gutentags_ctags_executable_ruby = 'rtags'
endif

set statusline+=%{gutentags#statusline()}
let g:gutentags_ctags_exclude = ['./config/routes/dekeo_wildcard.rb', './config/routes/dekeo.rb', 'build', 'vendor', '.git', 'node_modules', '.sass-cache', '.vagrant', 'docs', 'log']

" Use deoplete - Autocomplete Framework
" let g:deoplete#enable_at_startup = 1

" vim-rspecs configuration
let g:rspec_command = "!jd_rspec {spec}"

"let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
"let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" Scratch buffers
let g:scratch_persistence_file = './tmp/development_files/vim_scratch.rb'

" Enable NeoSolarized Colorscheme in vimR
if has('gui_vimr')
  let g:neosolarized_visibility = "normal"
  let g:neosolarized_vertSplitBgTrans = 1
  colorscheme NeoSolarized
endif

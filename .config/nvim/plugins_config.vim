" commands and configurtions for plugins goes here

" Plugin Install using minpac
command! PackUpdate call minpac#update()

" Plugin Uninstall using minpac
command! PackClean call minpac#clean()

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
let g:ale_fix_on_save = 1
" Disable ale linter to run on buffer open or edit when not saved
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1

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

" Vim Gutentags config
if executable('ripper-tags')
  let g:gutentags_ctags_executable_ruby = 'ripper-tags'
  let g:gutentags_ctags_extra_args = ['--ignore-unsupported-options', '--recursive']
endif

" let g:gutentags_trace = 1
set statusline+=%{gutentags#statusline()}
let g:gutentags_ctags_exclude = [
      \ './config/routes/dekeo_wildcard.rb',
      \ './config/routes/ratemydecorator.rb',
      \ './config/routes/dekeo.rb',
      \ 'build',
      \ 'vendor',
      \ '.git',
      \ 'node_modules',
      \ '.sass-cache',
      \ '.vagrant',
      \ 'docs',
      \ 'doc',
      \ 'log',
      \ 'public/packs',
      \ 'public/assets'
      \ ]

" vim-test configuration
"let test#ruby#rspec#executable = 'docker-compose -f "./docker-compose.yml" exec rails bundle exec rspec'
"let test#strategy = "neovim"

" Scratch buffers
let g:scratch_persistence_file = './tmp/development_files/vim_scratch.rb'

" colorscheme NeoSolarized
if has('gui_vimr')
  colorscheme kuroi
else
"  let g:neosolarized_visibility = "normal"
"  let g:neosolarized_vertSplitBgTrans = 1
"  colorscheme NeoSolarized
  colorscheme seti
endif

" Colorscheme Seti Specific Highlight Overrides
" TODO ADD THESE DETAILS IN FUTURE
augroup colorscheme_seti_highlights
  autocmd!
  hi Search ctermfg=Black ctermbg=74   cterm=NONE guifg=Black   guibg=#4fa5c7 gui=NONE
  hi Visual ctermfg=Black ctermbg=74   cterm=NONE guifg=Black   guibg=#4fa5c7 gui=NONE
  hi Folded ctermfg=130   ctermbg=NONE cterm=NONE guifg=#af5f00 guibg=NONE    gui=NONE
augroup END

" matchup configuration
" to improve cursor movement performance by delaying highlighting for a short time
let g:matchup_matchparen_deferred = 1

augroup matchup_matchup_highlight
  autocmd!
  " autocmd ColorScheme *
  hi MatchParen ctermfg=Black ctermbg=195 cterm=NONE guifg=Black guibg=#d7ffff gui=NONE
  " autocmd ColorScheme *
  hi MatchWord ctermfg=Black ctermbg=195 cterm=NONE guifg=Black guibg=#d7ffff gui=NONE
augroup END

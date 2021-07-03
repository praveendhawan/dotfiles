" commands and configurtions for plugins goes here

" Plugin Install using minpac
command! PackUpdate call minpac#update()

" Plugin Uninstall using minpac
command! PackClean call minpac#clean()

" Vim Grepper plugin configurations
"let g:grepper = {}
"let g:grepper.rg = {
"\  'grepprg': 'rg -H --no-heading --smart-case --vimgrep',
"\  'grepformat':  '%f:%l:%m',
"\  'escape': '\+*^$()[]'
"\ }

"let g:grepper.tools = ['rg', 'grep', 'git']

" vim-ripgrep settings
"let g:rg_format = '%f:%l:%m'
"let g:rg_command = 'rg -H --no-heading --smart-case --vimgrep'
"let g:rg_highlight = 'true'

" CTRLSF settings - alternative to vim-grepper
" Use rg for search
let g:ctrlsf_backend = 'rg'
" Compact mode for showing search results
let g:ctrlsf_default_view_mode = 'compact'
" allow to feed search results to quickfix lists
let g:ctrlsf_populate_qflist = 1
" Extra args to rg command
let g:ctrlsf_extra_backend_args = {
\ 'rg': '-H --no-heading --smart-case'
\ }

" Use async mode for search
let g:ctrlsf_search_mode = 'async'

" Autofocus to search result pane after the search is finished
let g:ctrlsf_auto_focus = {
\ "at": "start"
\ }
let g:ctrlsf_indent = 2

" Vim Gutentags config
if executable('ripper-tags')
  let g:gutentags_ctags_executable_ruby = 'ripper-tags'
  let g:gutentags_ctags_extra_args = ['--ignore-unsupported-options', '--recursive']
endif

" Set log level for gutentags
" let g:gutentags_trace = 1
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

" Scratch buffers
let g:scratch_persistence_file = './tmp/development_files/vim_scratch.rb'
let g:scratch_insert_autohide = 0
let g:scratch_filetype = 'ruby'

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
  hi Search            ctermfg=Black ctermbg=74   cterm=NONE guifg=Black   guibg=#4fa5c7 gui=NONE
  hi Visual            ctermfg=Black ctermbg=93   cterm=NONE guifg=Black   guibg=#664dc9 gui=NONE
  hi Folded            ctermfg=130   ctermbg=NONE cterm=NONE guifg=#af5f00 guibg=NONE    gui=NONE
  hi CocHighlightText  ctermfg=93    ctermbg=NONE cterm=NONE guifg=#664dc9 guibg=NONE    gui=NONE
  "hi lscReference      ctermfg=93    ctermbg=NONE cterm=NONE guifg=#664dc9 guibg=NONE    gui=NONE
augroup END

" matchup configuration
" to improve cursor movement performance by delaying highlighting for a short time
let g:matchup_matchparen_deferred = 1

augroup treesitter_context_highlight
  autocmd!
  " autocmd ColorScheme *
  hi TreesitterContext ctermfg=Black ctermbg=190 cterm=BOLD guifg=Black guibg=#d7ff00 gui=NONE
augroup END

augroup treesitter_matchup_highlight
  autocmd!
  " autocmd ColorScheme *
  hi MatchParen ctermfg=Black ctermbg=190 cterm=BOLD guifg=Black guibg=#d7ff00 gui=NONE
  hi MatchWord ctermfg=Black ctermbg=190 cterm=NONE guifg=Black guibg=#d7ff00 gui=BOLD
augroup END

" Add configuration for lightline
let g:lightline = {
  \ 'colorscheme': 'darcula',
  \ 'active': {
  \    'left': [
  \              [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'filename' ],
  \              [ 'nearest_method' ]
  \    ],
  \    'right': [
  \               ['lineinfo'],
  \               [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
  \               ['tags_generation'],
  \               ['coc_function']
  \    ],
  \  },
  \  'component': {
  \    'lineinfo': ' %3l:%-2v',
  \  },
  \  'component_function': {
  \    'gitbranch': 'fugitive#head',
  \    'coc_function': 'coc#status',
  \    'nearest_method': 'NearestMethodOrFunction',
  \    'tags_generation': 'gutentags#statusline',
  \  }
\}
" Lighline sections separator
let g:lightline.separator = {
  \  'left': '', 'right': ''
\}
" Lighline sections subseparator
let g:lightline.subseparator = {
  \  'left': '', 'right': ''
\}

" Add configuration for lightline-bufferline
let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline.tabline                 = {'left': [['buffers']], 'right': [[]]}
let g:lightline.component_expand = {
  \  'linter_checking': 'lightline#ale#checking',
  \  'linter_infos': 'lightline#ale#infos',
  \  'linter_warnings': 'lightline#ale#warnings',
  \  'linter_errors': 'lightline#ale#errors',
  \  'linter_ok': 'lightline#ale#ok',
  \  'buffers': 'lightline#bufferline#buffers'
  \ }

let g:lightline.component_type = {
  \ 'buffers': 'tabsel',
  \     'linter_checking': 'right',
  \     'linter_infos': 'right',
  \     'linter_warnings': 'warning',
  \     'linter_errors': 'error',
  \     'linter_ok': 'right',
  \ }

let g:lightline.component_raw           = {'buffers': 1}
let g:lightline#bufferline#clickable    = 1

" Automatic Update Lighline on Coc status or Diagnostics change
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" Helper Functions to show erros and diagnostic info on StatusLine for Coc
" Set signs for Coc Diagnostics
let g:lightline#ale#indicator_checking = "..."
let g:lightline#ale#indicator_infos = "◆"
let g:lightline#ale#indicator_warnings = "⚠"
let g:lightline#ale#indicator_errors = "✗"
let g:lightline#ale#indicator_ok = "✔"

" Formatting of js, ruby file via LSPs
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocActionAsync('formatSelected')
  autocmd FileType ruby setl formatexpr=CocActionAsync('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" ALE Settings
let g:ale_linters = {
 \   'ruby': ['rubocop', 'rufo'],
 \   'javascript': ['eslint'],
 \   'css': ['stylelint']
 \}

let g:ale_fixers = {
 \    'ruby': ['rubocop', 'rufo'],
 \   'javascript': ['eslint'],
 \}

let g:ale_fix_on_save = 0
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_sign_hint = '!'
let g:ale_sign_info = '◆'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_browser_command = 'chrome %URL% &'
let g:gist_post_private = 1

" QuickScope Config
" Start by disabled
" let g:qs_enable=0
" Only enable if line length is less than 100 chars
let g:qs_max_chars=100
" Trigger a highlight in the appropriate direction when pressing these keys
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" Color scheme
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END

" SplitJoin config
let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''

" vim-FZF configurations
let g:fzf_layout = { 'down': '30%' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Vista vim showing nearest method
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

" Vista vim configurtions
" Enable Icons
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
      \ "class": "╰─▸ ",
      \ "module": "╰─▸ ",
      \ "method": "├─▸  ",
      \ "singletonMethod": "├─▸ ",
      \ "function": "├─▸ ",
      \ "variable": "▸ ",
      \ "augroup": "╰─▸ ",
      \ "command": "╰─▸ "
      \ }
" let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
" This will be searched for first if the results
" are empty then the executive for setting will be taken
let g:vista_rb_executive = 'coc'
let g:vista_erb_executive = 'rtags'
let g:vista_executive_for = {
  \ 'rb': 'rtags'
  \ }

" Codi VIm Config
" since it is fullscreen, I'd like a 50/50 split
let g:codi#width = 50.0
let g:codi#virtual_text = 0

" Context.vim Settings
" Disable by default
" let g:context_enabled = 0
" If the context gets bigger than 11 lines,
" it will only show the first 5, then one line with ellipsis (···) and
" then the last ten context lines.
" let g:context_max_height = 11

" Vim Test Config
if has('nvim')
  let test#strategy='neovim'
else
  let test#strategy='vimterminal'
endif

let test#ruby#rspec#executable='docker compose -f docker-compose.yml exec -e COLUMNS=jd_stty_cols -e LINES=jd_stty_rows spring bundle exec spring rspec'

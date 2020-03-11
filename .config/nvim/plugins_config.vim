" commands and configurtions for plugins goes here

" Plugin Install using minpac
command! PackUpdate call minpac#update()

" Plugin Uninstall using minpac
command! PackClean call minpac#clean()

" Vim Grepper plugin configurations
let g:grepper = {}
let g:grepper.rg = {
\  'grepprg': 'rg -H --no-heading --smart-case --vimgrep',
\  'grepformat':  '%f:%l:%m',
\  'escape': '\+*^$()[]'
\ }

let g:grepper.tools = ['rg', 'grep', 'git']

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

" Add configuration for lightline
let g:lightline = {
  \ 'colorscheme': 'darcula',
  \ 'active': {
  \    'left': [
  \              [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'filename' ]
  \    ],
  \    'right': [
  \               ['lineinfo'],
  \               [ 'coc_function' ],
  \               [ 'coc_error', 'coc_warning', 'coc_hint', 'coc_info'],
  \               ['tags_generation']
  \    ],
  \  },
  \  'component': {
  \    'lineinfo': ' %3l:%-2v',
  \  },
  \  'component_function': {
  \    'gitbranch': 'fugitive#head',
  \    'coc_function': 'CocCurrentFunction',
  \    'coc_error': 'LightlineCocErrors',
  \    'coc_warning': 'LightlineCocWarnings',
  \    'coc_info': 'LightlineCocInfos',
  \    'coc_hint': 'LightlineCocHints',
  \    'coc_fix': 'LightlineCocFixes',
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
let g:lightline.component_expand        = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type          = {
  \ 'buffers': 'tabsel',
\   'coc_error'        : 'error',
\   'coc_warning'      : 'warning',
\   'coc_info'         : 'tabsel',
\   'coc_hint'         : 'middle',
\   'coc_fix'          : 'middle',
  \ }
let g:lightline.component_raw           = {'buffers': 1}
let g:lightline#bufferline#clickable    = 1

" Automatic Update Lighline on Coc status or Diagnostics change
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" Helper Functions to show erros and diagnostic info on StatusLine for Coc
function! s:lightline_coc_diagnostic(kind, sign) abort
  let info = get(b:, 'coc_diagnostic_info', 0)
  if empty(info) || get(info, a:kind, 0) == 0
    return ''
  endif
  try
    let s = g:coc_user_config['diagnostic'][a:sign . 'Sign']
  catch
    let s = ''
  endtry
  return printf('%s %d', s, info[a:kind])
endfunction

function! LightlineCocErrors() abort
  return s:lightline_coc_diagnostic('error', 'error')
endfunction

function! LightlineCocWarnings() abort
  return s:lightline_coc_diagnostic('warning', 'warning')
endfunction

function! LightlineCocInfos() abort
  return s:lightline_coc_diagnostic('information', 'info')
endfunction

function! LightlineCocHints() abort
  return s:lightline_coc_diagnostic('hints', 'hint')
endfunction
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction
" Set signs for Coc Diagnostics
let g:coc_user_config = {
\  'diagnostic': {
\     'errorSign': '✗',
\     'warningSign': '⚠',
\     'infoSign': '◆',
\     'hintSign': '!'
\  }
\}
" Auto Install coc plugins
let g:coc_global_extensions = [
\  'coc-webpack',
\  'coc-marketplace',
\  'coc-git',
\  'coc-json',
\  'coc-eslint',
\  'coc-yaml',
\  'coc-vetur',
\  'coc-tsserver',
\  'coc-elixir',
\  'coc-solargraph',
\  'coc-snippets'
\]

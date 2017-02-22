set nocompatible
filetype off  

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" tree structure view vim
Plugin 'scrooloose/nerdtree'
" git support for nerd tree
Plugin 'Xuyuanp/nerdtree-git-plugin'
"  NERDTree feel like a true panel, independent of tabs
Plugin 'jistr/vim-nerdtree-tabs'
" comment support
Plugin 'scrooloose/nerdcommenter'
" save  sessions
Plugin 'xolox/vim-session'
"autocomplete
Plugin 'Valloric/YouCompleteMe'
"fuxxy file finder
Plugin 'ctrlpvim/ctrlp.vim'
" automatic closing for brackets parenthesis etc.
Plugin 'Raimondi/delimitMate'
"git gutter for vim
Plugin 'airblade/vim-gitgutter'
" manage parenthesis brackets etc.
Plugin 'tpope/vim-surround'
" Syntastic is a syntax checking plugin for Vim
Plugin 'vim-syntastic/syntastic'
" rails development made easy for vim
Plugin 'tpope/vim-rails'
" global search and replace
Plugin 'vim-scripts/greplace.vim'
" cool status line
Plugin 'vim-airline/vim-airline'
" airline themes
Plugin 'vim-airline/vim-airline-themes'
" highlight trailing spaces
Plugin 'bronson/vim-trailing-whitespace'
" auto save
Plugin 'vim-scripts/vim-auto-save'
" color scheme
Plugin 'flazz/vim-colorschemes'
" autocomlete def, if etc.
Plugin 'tpope/vim-endwise'
" multiple cursors
Plugin 'terryma/vim-multiple-cursors'
" session management
Plugin 'tpope/vim-obsession'
" session management
Plugin 'dhruvasagar/vim-prosession'
" root directory chnager for vim
Plugin 'airblade/vim-rooter'
"git support
Plugin 'tpope/vim-fugitive'
call vundle#end()            " required


filetype plugin indent on    " required
" ctrl n to toggle tree view
map <C-n> :NERDTreeToggle<CR>
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" enable airline themes
let g:airline#extensions#tabline#enabled = 1

" for nerd commenter
filetype plugin on
" ctrl p to fuzzy file finder
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" set ycm python interpreter path
let g:ycm_server_python_interpreter = '/usr/bin/python'

" switch between buffers
:nnoremap <C-Tab> :bnext<CR>
:nnoremap <C-S-Tab> :bprevious<CR>

" powerline fonts enabling in vim
let g:airline_powerline_fonts = 1
" theme set 
let g:airline_theme='luna'

" color
set t_Co=256

" fontset for vim
set guifont=Meslo\ LGL\ DZ\ for\ Powerline

" powerline symbols 
let g:Powerline_symbols = 'fancy'

" autosave true
let g:auto_save = 1
" multiple cursors setting
let g:multi_cursor_next_key='<C-d>'
  
" root changer 
let g:rooter_change_directory_for_non_project_files = '' " dont change to root for non project folders

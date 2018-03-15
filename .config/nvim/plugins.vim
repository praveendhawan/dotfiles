" This file is used for plugins for nvim

" Setup vundle path
set rtp+=~/.config/nvim/bundle/Vundle.vim

" Start vundle 
call vundle#begin('~/.config/nvim/bundle')
  " Plugin Manager for Vim
  Plugin 'VundleVim/Vundle.vim'
  " Git wrapper
  Plugin 'tpope/vim-fugitive'
  " File system explorer
  Plugin 'scrooloose/nerdtree'
  " change and add brackets surroundings in pairs
  Plugin 'tpope/vim-surround'
  " Syntax Checking
  Plugin 'scrooloose/syntastic'
  " Git Gutter
  Plugin 'airblade/vim-gitgutter'
  " browse the tags of the current file
  Plugin 'majutsushi/tagbar'
  " Lean & mean status/tabline for vim
  Plugin 'vim-airline/vim-airline'
  " official theme repository for vim-airline
  Plugin 'vim-airline/vim-airline-themes'
  " Full path fuzzy file, buffer, mru, tag, ... finder for Vim
  Plugin 'ctrlpvim/ctrlp.vim'
  " For text filtering and alignment
  Plugin 'godlygeek/tabular'
  " Emmet for Vim
  Plugin 'mattn/emmet-vim'
  " Code completion Engine for VIm
  Plugin 'shougo/deoplete.nvim'
  " Coffescript support for vim
  Plugin 'kchmck/vim-coffee-script'
  " Rails support for vim
  Plugin 'tpope/vim-rails'
  " Indent Guide for vim
  Plugin 'nathanaelkane/vim-indent-guides'
  " Multiple cursors support for vim
  Plugin 'terryma/vim-multiple-cursors'
  " Git status in NERDTree
  Plugin 'xuyuanp/nerdtree-git-plugin'
  " Elixir support for vim
  Plugin 'elixir-lang/vim-elixir'
  " trailing whitespace highlighting
  Plugin 'bronson/vim-trailing-whitespace'
  " Dockerfile syntax
  Plugin 'ekalinin/dockerfile.vim'
  " Grep support for Vim
  Plugin 'grep.vim'
  " Session Mgmt. for Vim
  Plugin 'xolox/vim-session'
call vundle#end()
" End Vundle

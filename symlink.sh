#!/bin/bash

dotfilesDir=$(pwd)/dotfiles

function linkDotfile {
  dest="${HOME}/${1}"
  dateStr=$(date +%Y-%m-%d-%H%M)

  if [ -h ~/${1} ]; then
    # Existing symlink 
    echo "Removing existing symlink: ${dest}"
    rm ${dest} 

  elif [ -f "${dest}" ]; then
    # Existing file
    echo "Backing up existing file: ${dest}"
    mv ${dest}{,.${dateStr}}

  elif [ -d "${dest}" ]; then
    # Existing dir
    echo "Backing up existing dir: ${dest}"
    mv ${dest}{,.${dateStr}}
  fi

  echo "Creating new symlink: ${dest}"
  ln -s ${dotfilesDir}/${1} ${dest}
}

# bash related
linkDotfile .bash_aliases
linkDotfile .bash_profile
linkDotfile .bashrc

# Nvim
linkDotfile .config

# ruby
linkDotfile .gemrc

# git
linkDotfile .gitconfig
linkDotfile .gitignore_global

# jiffy
linkDotfile .jiffy-docker-aliases

# zsh
linkDotfile .profile
linkDotfile .spaceship_config
linkDotfile .zshenv
linkDotfile .zshrc

# ripgrep
linkDotfile .ripgreprc

# tmux
linkDotfile .tmux.conf

# mkdir -p $dotfilesDir/.vim/bundle
# cd $dotfilesDir/.vim/bundle
# git clone git://github.com/VundleVim/Vundle.vim.git
# vim +PluginInstall +qall
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$PATH:$HOME/.rvm/bin"

# Configuration based in terminal program
if [[ $LC_TERMINAL == 'iTerm2' ]]; then
  export ZSH_TMUX_ITERM2="true"
fi

# Settings for ripgrep
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/.ripgreprc"
# FZF configurations
# Installed via brew so its already included in path
# adding config for default options
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --ansi'
export FZF_DEFAULT_COMMAND='fd -H -I --type f --color=always'

# Configuration based in terminal program
#if [[ $LC_TERMINAL == 'iTerm2' ]]; then
#  export ZSH_TMUX_ITERM2="true"
#fi

# Settings for ripgrep
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
# FZF configurations
# Installed via brew so its already included in path
# adding config for default options
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_DEFAULT_COMMAND='rg --files'


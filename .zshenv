uname=$(uname -s)

# Load correct homebrew
if [[ "$uname" == "Darwin" ]] ; then
else
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load RVM into a shell session *as a function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Settings for ripgrep
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/.ripgreprc"
# FZF configurations
# Installed via brew so its already included in path
# adding config for default options
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --ansi'
export FZF_DEFAULT_COMMAND='fd -H -I --type f --color=always'

# for brew analytics
export HOMEBREW_NO_ANALYTICS=1

# Brewfile location
export HOMEBREW_BUNDLE_FILE="$HOME/.config/brewfile/.Brewfile"

# for elixir iex session history configs
export ERL_AFLAGS="-kernel shell_history enabled"

export STARSHIP_CONFIG=~/.config/starship/starship.toml

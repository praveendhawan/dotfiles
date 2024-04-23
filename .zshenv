uname=$(uname -s)

# Load correct homebrew
if [[ "$uname" == "Darwin" ]] ; then
else
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

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

# starship prompt config path
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# asdf config path
export ASDF_CONFIG_FILE=~/.config/asdf/asdfrc
export ASDF_GEM_DEFAULT_PACKAGES_FILE=~/.config/asdf/default-gems
export ASDF_NPM_DEFAULT_PACKAGES_FILE=~/.config/asdf/default-npm-packages

# Hledger
export LEDGER_FILE="$HOME/Documents/paisa/main.journal"

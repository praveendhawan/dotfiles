uname=$(uname -s)

# Load correct homebrew
if [[ "$uname" == "Darwin" ]] ; then
elif grep -q '^ID=alpine' /etc/os-release; then
elif grep -q '^ID=arch' /etc/os-release; then
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

# k9s config path
export K9S_CONFIG_DIR=~/.config/k9s

# Hledger
export LEDGER_FILE="$HOME/Documents/paisa/2025.journal"

# Created by `pipx` on 2024-08-13 07:59:31
export PATH="$PATH:/Users/praveen/.local/bin"

# pnpm
export PNPM_HOME="/Users/praveen/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

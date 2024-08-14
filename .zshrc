export ZSH=~/.oh-my-zsh

CASE_SENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  aliases
  aws
  git
  zsh-autosuggestions
  eza
  kubectl
)

if command -v tmux >/dev/null 2>&1; then
  plugins+=(tmux)
fi

if command -v pacman >/dev/null 2>&1; then
  plugins+=(archlinux)
fi

if command -v asdf >/dev/null 2>&1; then
  plugins+=(asdf)
fi

source $ZSH/oh-my-zsh.sh

ZSH_COMPDUMP=$XDG_CACH_HOME/zsh/zcompdump

# User configuration

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# ssh
export SSH_KEY_PATH="~/.ssh/"

# https://github.com/zsh-users/zsh-autosuggestions/issues/489
# Start writing in shell, paste something and right arrow still
# auto completes. To solve this is needed.
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(bracketed-paste)

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

# This will include exercism completetion script in zsh
if [ -f ~/.config/exercism/exercism_completion.zsh ]; then
  source ~/.config/exercism/exercism_completion.zsh
fi

uname=$(uname -s)
if [[ "$uname" == "Darwin" ]] ; then
  if [ -f /opt/component_tree/bin/ctree ]; then
    export PATH="$PATH:/opt/component_tree/bin/ctree"
  fi
fi
export PATH="$PATH:/usr/local/sbin"

if [ -f $HOME/.src_env ]; then
  source "$HOME/.src_env"
fi

if command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
else
  echo "Starship is not installed. Skipping initialization."
fi

# Use asdf instead of rvm.RVM install doesnt work with M2
if [[ "$uname" == Darwin ]]; then
  . $(brew --prefix asdf)/libexec/asdf.sh
elif grep -q '^ID=alpine' /etc/os-release; then
  . "$HOME/.asdf/asdf.sh"
elif grep -q '^ID=arch' /etc/os-release; then
  . "$HOME/.asdf/asdf.sh"
else
  . $(brew --prefix asdf)/libexec/asdf.sh
fi

# Created by `pipx` on 2024-08-13 07:59:31
export PATH="$PATH:/Users/praveen/.local/bin"

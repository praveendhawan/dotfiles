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
  git
  docker
  docker-compose
  tmux
  terraform
)

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
. /opt/homebrew/opt/asdf/libexec/asdf.sh

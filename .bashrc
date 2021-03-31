
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
if [ -f ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi
source "$HOME/.cargo/env"

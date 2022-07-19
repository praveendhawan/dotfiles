alias goto_dekeo="cd ~/jiffyshirts"
alias reload_zsh="source ~/.zshrc"
alias reload_bash="source ~/.bashrc"
alias vimconf="cd ~/.config/nvim"
# this is added because I mistype it a lot ;)
alias gti="git"
# alias ngrok="/Applications/ngrok"
alias c="clear -x"

function ggrm() {
  local bm="$(git_current_branch)"
  # gcm - git co master
  gcm && gup && gco $bm && grbm
}

# alias pbcopy="xclip -sel clip"

if [ -x "$(command -v docker)" ]; then
  if [ -f ~/.jiffy-docker-aliases ]; then
    source ~/.jiffy-docker-aliases
  fi
else
  if [ -f ~/.jiffy-aliases ]; then
    source ~/.jiffy-aliases
  fi
fi

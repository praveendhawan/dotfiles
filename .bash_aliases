alias worksapce="cd ~/code"
alias goto_dekeo="cd ~/code/spree-jiffyshirts"
#alias musync="cd ~/workspace/Personal/musync"
#alias cd_pair="cd ~/workspace/Personal/Paironauts"
#alias elixir_practice="cd ~/workspace/Practice/Elixir"
#alias personal_projects="cd ~/workspace/Personal"
#alias practice_projects="cd ~/workspace/Practice"
alias reload_zsh="source ~/.zshrc"
alias reload_bash="source ~/.bashrc"
# this is added because I mistype it a lot ;)
alias gti="git"

function ggrm() {
  local bm="$(git_current_branch)"
  # gcm - git co master
  gcm && gup && gco $bm && grbm
}

if [ -f ~/.jiffy-docker-aliases ]; then
  source ~/.jiffy-docker-aliases
fi

alias worksapce="cd ~/workspace"
alias office="cd ~/workspace/Office"
alias goto_dekeo="cd ~/workspace/Office/spree-jiffyshirts"
alias personal_projects="cd ~/workspace/Personal"
alias practice_projects="cd ~/workspace/Practice"
alias gpush="git push origin"
alias gpull="git pull origin"
alias rs="rails server"
alias up_dekeo="cd ~/workspace/Office/spree-jiffyshirt && vagrant up && vagrant ssh"
alias reload_zsh="source ~/.zshrc"
alias reload_bash="source ~/.bashrc"
alias my_qa_ssh="ssh -i ~/.ssh/qa.pem ubuntu@praveen.sdtechdev.com"
alias stage_ssh="ssh jiffy-stage"
alias prod_ssh="ssh jiffy-prod"

if [ -f ~/.jiffy-docker-aliases ]; then
        source ~/.jiffy-docker-aliases
fi

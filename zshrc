if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

#bindkey -e

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


#alias docker="sudo docker"
alias rsp="cd ~/Projects/Office/gor_refactored && rails server -p"
alias rs="cd ~/Projects/Office/gor_refactored && rails server"
alias rc="cd ~/Projects/Office/gor_refactored && rails console"
alias goto_refactored="cd ~/Projects/Office/gor_refactored"
alias projects="cd ~/Projects/"
alias gpush="git push origin"
alias gpull="git pull origin"
alias killkibana="sudo service kibana stop"
alias youtube-dl-mp3="youtube-dl -x --audio-format \"mp3\" --audio-quality 0"
alias mp4-to-mp3="ffmpeg -i"
alias dockerstart="docker start elasticsearch mongo redis"
alias dockerstop="docker stop redis mongo elasticsearch"
#alias kprod="kubectl --namespace=prod"
##alias kpods="kubectl --namespace=prod get pods"
##alias kube_ui="kubectl proxy -p 3100"
export PATH=$HOME/bin:$PATH
export PATH=$HOME/Personel/Practice/bin:$PATH

function kprod(){
    kubectl --namespace=prod
}

function kpods(){
    kprod get pods
}

function kube_ui(){
    kubectl proxy -p 3100
}

function hrc () {
    kubectl --namespace=prod exec -it $(kubectl --namespace=prod get pods | grep grabonrent-controller-hyd | awk '{print $1}') -- bash -c 'source ~/.bashrc && cd gor_refactored && rvm-exec 2.3.3 rails c'
}

function brc () {
        kubectl --namespace=prod exec -it $(kubectl --namespace=prod get pods | grep grabonrent-controller-blr | awk '{print $1}') -- bash -c 'source ~/.bashrc && cd gor_refactored && rvm-exec 2.3.3 rails c'
}


function hbash() {
        kubectl --namespace=prod exec -it $(kubectl --namespace=prod get pods | grep grabonrent-controller-hyd | awk '{print $1}') bash;
}

function bbash() {
        kubectl --namespace=prod exec -it $(kubectl --namespace=prod get pods | grep grabonrent-controller-blr | awk '{print $1}') bash;
}


#alias hrc="kubectl --namespace=prod exec -it $(kubectl --namespace=prod get pods | grep grabonrent-controller-hyd | awk '{print $1}') -- bash -c 'source ~/.bashrc && cd gor_refactored && rvm-exec 2.3.3 rails c'"
#alias brc="kubectl --namespace=prod exec -it $(kubectl --namesapce=prod get pods | grep grabonrent-controller-blr | awk '{print $1}') -- bash -c 'source ~/.bashrc && cd gor_refactored && rvm-exec 2.3.3 rails c'"

export NVM_DIR="/home/dhawan/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

if [ $commands[kubectl] ]; then
    source <(kubectl completion zsh)
fi
# Load rvm as a function

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$HOME/.rvm/bin:$PATH"


alias reload!='. ~/.zshrc'
alias vim="/usr/local/bin/vim"

#
# GIT aliases
#
alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative --all"
alias gclean="git pull origin --rebase; git branch --merged | grep -v \"\*\" | xargs -n 1 git branch -d"

alias gpu='git push origin -u `git rev-parse --abbrev-ref HEAD`'
alias gc='git commit -e '

#
# Kubernetes aliases
#
alias k='kubectl'
alias kc='kubectl config use-context'


#
# Heroku aliases
#
alias h=heroku
alias hs="heroku sudo"

cloud() {
  eval "$(ion-client shell)"
  export CAAS_HOST=cloudformation.herokai.com
  cloud "$@"
}

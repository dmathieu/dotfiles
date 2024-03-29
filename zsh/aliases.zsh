alias reload!='. ~/.zshrc'

#
# GIT aliases
#
alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative --all"
alias gclean="git pull origin --rebase; git branch --merged | grep -v \"\*\" | xargs -n 1 git branch -d"

alias gpu='git push origin -u `git rev-parse --abbrev-ref HEAD`'
alias gpdu='git push dmathieu -u `git rev-parse --abbrev-ref HEAD`'
alias gc='git commit -e '

cluster() {
  cluster=$(echo $1 | cut -d ':' -f 1)
  namespace=${$(echo $1 | cut -d ':' -f 2):-default}

  if [[ "$namespace" == "$cluster" ]]; then
    namespace="default"
  fi

  if [[ "$cluster" != "" ]]; then
    kubectl config use-context $cluster
  fi

  kubectl config set-context $(kubectl config current-context) --namespace=$namespace
}

alias vim="nvim"

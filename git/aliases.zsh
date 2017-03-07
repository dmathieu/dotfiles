# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if [[ -f $hub_path ]]
then
  alias git=$hub_path
fi

# The rest of my fun git aliases
alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative --all"
alias gclean="git pull origin --rebase; git branch --merged | grep -v \"\*\" | xargs -n 1 git branch -d"

alias gpu='git push origin -u `git rev-parse --abbrev-ref HEAD`'
alias gc='git commit -e '

autoload colors && colors

directory_name() {
  dname=$(projectName)
  if [[ $dname == "N/A" ]]
  then
    dname="%1/%\/"
  fi

  echo "%{$fg_bold[cyan]%}${dname}%{$reset_color%}"
}

cloud_name() {
  if ! [[ -z $HEROKU_CLOUD ]]
  then
    echo "%{$fg_bold[blue]%}%{$HEROKU_CLOUD%}%{$reset_color%} "
  else
    echo ""
  fi
}

export PROMPT=$'$(cloud_name)\n$(directory_name)› '
export PROMPT="$PROMPT\$(master_fire)\$(git-radar --zsh --fetch) "
set_prompt () {
  export RPROMPT="%{$fg_bold[cyan]%}%{$reset_color%}"
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}

master_fire() {
  if [[ `git symbolic-ref --short HEAD 2>/dev/null` == "master" ]]; then
    echo "🔥"
  fi
}

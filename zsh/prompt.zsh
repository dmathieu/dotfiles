autoload colors && colors

directory_name() {
  dname=$(projectName)
  if [[ $dname == "N/A" ]]
  then
    dname="%1/%\/"
  fi

  echo "%{$fg_bold[cyan]%}${dname}%{$reset_color%}"
}

export PROMPT=$'$(directory_name)› '
if uname | grep -q "Darwin"; then
	export PROMPT="$PROMPT\$(master_fire)\$(git-radar --zsh --fetch) "
fi

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

autoload colors && colors

ruby_version() {
  if (( $+commands[rbenv] ))
  then
    echo "$(rbenv version | awk '{print $1}')"
  fi

  if (( $+commands[rvm-prompt] ))
  then
    echo "$(rvm-prompt | awk '{print $1}')"
  fi
}

node_version() {
  if (( $+commands[node] ))
  then
    echo $(node --version)
  fi
}

versions_prompt() {
  if ! [[ -z "$(ruby_version)" ]]
  then
    ruby="%{$fg_bold[yellow]%}$(ruby_version)%{$reset_color%} "
  else
    ruby=""
  fi

  if ! [[ -z "$(node_version)" ]]
  then
    node="%{$fg_bold[green]%}$(node_version)%{$reset_color%} "
  else
    node=""
  fi

  echo "%{$node%}%{$ruby%}"
}

directory_name() {
  echo "%{$fg_bold[cyan]%}%1/%\/%{$reset_color%}"
}

cloud_name() {
  if ! [[ -z $HEROKU_CLOUD ]]
  then
    echo "%{$fg_bold[blue]%}%{$HEROKU_CLOUD%}%{$reset_color%} "
  else
    echo ""
  fi
}

export PROMPT=$'\n$(versions_prompt)in $(directory_name) $(cloud_name)\n› '
export PROMPT="$PROMPT\$(git-radar --zsh --fetch) "
set_prompt () {
  export RPROMPT="%{$fg_bold[cyan]%}%{$reset_color%}"
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}

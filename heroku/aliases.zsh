alias h=heroku
alias hs="heroku sudo"

cloud() {
  eval "$(ion-client shell)"
  cloud "$@"
}

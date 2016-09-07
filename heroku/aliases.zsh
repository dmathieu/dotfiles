alias h=heroku
alias hs="heroku sudo"

cloud() {
  eval "$(ion-client shell)"
  export CAAS_HOST=cloudformation.herokai.com
  cloud "$@"
}

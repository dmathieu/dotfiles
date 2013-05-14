alias sc='bundle exec rails c'
alias sg='bundle exec rails g'

alias migrate='rake db:migrate db:test:clone'

function feature() {
  bundle exec cucumber $1 $2 $3 $4 $5 --require features
}

alias sc='bundle exec rails c'
alias sg='bundle exec rails g'

alias migrate='rake db:migrate db:test:clone'

function feature() {
  bundle exec cucumber $1 --require features
}

export RUBY_GC_MALLOC_LIMIT=60000000
export RUBY_FREE_MIN=200000

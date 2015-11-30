export CODEPATH=~/code

function project() {
  users=(heroku dmathieu)

  for user in $users; do
    dir=$CODEPATH"/src/github.com/"$user"/"$1

    if [[ -d $dir ]]; then
      cd $dir
      return
    fi
  done

  for user in $users; do
    apiUri="https://api.github.com/repos/"$user"/"$1
    gitUri="https://github.com/"$user"/"$1".git"
    code=`curl -n -o /dev/null --silent --head --write-out '%{http_code}\n' $apiUri`

    if [[ $code == 200 ]]; then
      dir=$CODEPATH"/src/github.com/"$user"/"$1
      git clone $gitUri $dir
      cd $dir
      return
    fi
  done

  echo "Couldn't find any project '$1'. Did you mistype it?"
}


alias p="project"

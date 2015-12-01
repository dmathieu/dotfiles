export CODEPATH=~/code

function project() {
  users=(heroku dmathieu)

  if [ ${1[(ws:/:)1]} != ${1[(ws:/:)2]} ]; then
    stickyUser=${1[(ws:/:)1]}
    projectName=${1[(ws:/:)2]}
  else
    stickyUser=
    projectName=$1
  fi

  for user in $users; do
    if [[ -z $stickyUser || $stickyUser == $user ]]; then
      dir=$CODEPATH"/src/github.com/"$user"/"$projectName

      if [[ -d $dir ]]; then
        cd $dir
        return
      fi
    fi
  done

  for user in $users; do
    if [[ -z $stickyUser || $stickyUser == $user ]]; then
      apiUri="https://api.github.com/repos/"$user"/"$projectName
      gitUri="https://github.com/"$user"/"$projectName".git"
      code=`curl -n -o /dev/null --silent --head --write-out '%{http_code}\n' $apiUri`

      if [[ $code == 200 ]]; then
        dir=$CODEPATH"/src/github.com/"$user"/"$projectName
        git clone $gitUri $dir
        cd $dir
        return
      fi
    fi
  done

  echo "Couldn't find any project '$1'. Did you mistype it?"
}


alias p="project"

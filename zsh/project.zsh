export CODEPATH=~/code

function projectName() {
  if [[ "$1" != "" ]]; then
    project="$1"
  else
    project=`pwd`
  fi
  name=${project##$CODEPATH/src/github.com/}

  if [[ $name = /* ]]; then
    echo "N/A"
  else
    echo $name
  fi
}

function project() {
  me=dmathieu
  work=elastic
  users=($(ls $CODEPATH/src/github.com))

  if [[ $1 =~ .*/.* ]]; then
    users=(${1[(ws:/:)1]})
    name=${1[(ws:/:)2]}
  else
    name=$1
  fi

  if [[ $* == *\ -n* ]]; then
    if [[ ${#users[@]} > 1 ]]; then
      user=$me
    else
      user=$users
    fi

    dir=$CODEPATH"/src/github.com/"$user"/"$name

    echo "Initializing new project "$user"/"$name
    mkdir -p $dir
    cd $dir
    git init

    if [ $user != $work ]; then
      git home
    fi

    return
  fi

  for user in $users; do
    dir=$CODEPATH"/src/github.com/"$user"/"$name

    if [[ -d $dir ]]; then
      cd $dir

      if [[ $* != *\ -s* ]]; then
        default_branch="master"
        if [[ -n `git show-ref refs/heads/main` ]]; then
          default_branch="main"
        fi

        git checkout $default_branch
        gclean
      fi

      return
    fi
  done

  for user in $users; do
    gitUri="https://github.com/"$user"/"$name
    code=`curl -n -o /dev/null --silent --head --write-out '%{http_code}\n' $gitUri`

    if [[ $code -lt 400 ]]; then
      dir=$CODEPATH"/src/github.com/"$user"/"$name
      git clone $gitUri $dir

      cd $dir
      if [ $user != $work ]; then
        git home
      fi

      return
    fi
  done

  echo "Couldn't find any project '$1'. Did you mistype it?"
}


alias p="project"

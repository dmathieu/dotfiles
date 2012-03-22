ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails)

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

source $ZSH/oh-my-zsh.sh

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:~/Development/Scala/play-2.0-RC3 # Add play to PATH
PATH=$PATH:~/Development/android-sdk/tools:~/Development/android-sdk/platform-tools # Add android SDK to PATH

export EDITOR=mvim
export LC_CTYPE=en_US.UTF-8

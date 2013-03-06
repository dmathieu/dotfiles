ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails)

[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh

source $ZSH/oh-my-zsh.sh

PATH=/usr/local/bin:$PATH:/usr/local/sbin

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:~/Development/Scala/play-2.0-RC3 # Add play to PATH
PATH=$PATH:~/Development/android-sdk/tools:~/Development/android-sdk/platform-tools # Add android SDK to PATH
export PATH=/Library/PostgreSQL/9.1/bin:$PATH # Add the postgres current version bin to PATH

PATH=$PATH:/usr/local/sbin

export EDITOR=mvim
export LC_CTYPE=en_US.UTF-8

git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"

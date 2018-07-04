# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin
export PATH

export HISTSIZE=50000
export HISTTIMEFORMAT='%Y-%m-%d %T '

alias ls='ls -F --color=auto'
alias rm='rm -i'

alias ssh="cat ~/.ssh/conf.d/config ~/.ssh/conf.d/*.conf > ~/.ssh/config; ssh"
alias scp="cat ~/.ssh/conf.d/config ~/.ssh/conf.d/*.conf > ~/.ssh/config; scp"

if [ `which aws` ]; then
    complete -C '/usr/bin/aws_completer' aws
fi

if [ -d $HOME/.anyenv ] ; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
fi


function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}
function promps {
    local  BLUE="\[\e[1;34m\]"
    local  RED="\[\e[1;31m\]"
    local  GREEN="\[\e[1;32m\]"
    local  WHITE="\[\e[00m\]"
    local  GRAY="\[\e[1;37m\]"

    case $TERM in
        xterm*) TITLEBAR='\[\e]0;\W\007\]';;
        *)      TITLEBAR="";;
    esac
    local BASE="\u@\h"
    PS1="${TITLEBAR}${GREEN}${BASE}${WHITE}:${BLUE}\W${GREEN}\$(parse_git_branch)${BLUE}\$${WHITE} "
}
promps


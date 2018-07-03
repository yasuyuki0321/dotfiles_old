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


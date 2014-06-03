export TERM=xterm-256color

# Google Go Lang Vars
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin

# Export my ~/bin
export PATH=$HOME/bin:$PATH
export EDITOR='subl -w'

# For autocomplition
if [ -f `brew --prefix`/etc/bash_completion ]; then
    source `brew --prefix`/etc/bash_completion
fi

source ~/.git-completion.bash

export JRUBY_OPTS=--1.9

eval "$(direnv hook $0)"

function branchname { git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/[\1]/'; }

PS1='\[\e[01;35m\]\h\[\e[01;34m\]\[\e[01;31m\]:\e[01;36m\] \w\e[34m\]$(branchname) \[\e[01;35m\]⇒ \[\e[00m\] '

if ps $PPID |grep mc; then
  PS1='[mc]\[\033[01;32m\]\h\[\033[01;34m\] \W\[\033[31m\]$(__git_ps1 "(%s)") \[\033[01;34m\]⇒ \[\033[00m\] '
fi

export JAVA_HOME="/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home"

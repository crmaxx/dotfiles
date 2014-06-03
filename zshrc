# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="crmaxx"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(ssh git github rails ruby rvm gem brew bundler golang heroku powify zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
##################################################################################################
#ZSH_TMUX_FIXTERM_WITH_256COLOR="screen-256color"
#ZSH_TMUX_AUTOSTART=true
#ZSH_TMUX_ITERM2=true

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

PATH="/usr/local/bin:/usr/local/sbin:$PATH"

export TERM=xterm-256color

# Google Go Lang Vars
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin

export JRUBY_OPTS=--1.9

# Load direnv
eval "$(direnv hook $0)"

# Export my ~/bin
PATH=$HOME/bin:$PATH
export EDITOR='subl -w'
unsetopt correct_all

export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export JAVA_HOME="/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home"

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

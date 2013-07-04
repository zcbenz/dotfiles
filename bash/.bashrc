#!/bin/bash

# Convient settings
alias l='ls -p'
alias la='ls -a'
alias ll='ls -lh'
alias df='df -h'
alias sudo='sudo env PATH=$PATH' # sudo with current PATH
alias cn='env LANG=zh_CN.UTF-8 '
function mkcd ()
{
    mkdir $1 && cd $1
}

# Extra tools
source ~/.tools_aliases

# Bash settings
export CLICOLOR=1
export HISTSIZE=3000
export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT='%F %T '
shopt -s histappend
shopt -s checkwinsize

OS=${OSTYPE//[0-9.]/} # remove trailing version like in darwin9.0

# kitten#1575:~$
if [[ "$OS" != 'cygwin' ]]; then
  PS1='\h#\!:\w\[\e[0;33m\]\[`tput bold`\]\$\[`tput rmso`\]\[\e[m\] '
fi

# I use vim!
set -o vi
export EDITOR=vim
alias vi="vim -p"

# OS specific commands
if [[ $OS == 'darwin' ]]; then
  export PATH=~/bin/darwin:/usr/local/bin:$PATH
elif [[ $OS == 'linux' ]]; then
  alias open="xdg-open"
elif [[ $OS == 'cygwin' ]]; then
  alias open="cygstart"
  alias ls="ls --color"
  alias ahk="/cygdrive/c/Program\ Files/AutoHotkey/AutoHotkey.exe"
  export LC_ALL='en_US.UTF-8'
fi

# Import secrect environments
if [ -e "$HOME/bin/set-env" ]; then
  source "$HOME/bin/set-env"
fi

# Show me fortune at last
[ -z $1 ] && fortune

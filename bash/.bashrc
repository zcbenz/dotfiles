#!/bin/bash

# Convient settings
alias la='ls -a'
alias ll='ls -l'
alias sudo='sudo env PATH=$PATH' # sudo with current PATH
alias cn='env LANG=zh_CN.UTF-8 '
function mkcd ()
{
    mkdir $1 && cd $1
}

# Extra tools
source ~/.tools_aliases

# Bash settings
export HISTSIZE=3000
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups,ignoreboth
export HISTTIMEFORMAT='%F %T '
shopt -s histappend
shopt -s checkwinsize

# kitten#1575:~$
PS1='\h#\!:\w\[\e[0;33m\]\[`tput bold`\]\$\[`tput rmso`\]\[\e[m\] '

# I use vim!
set -o vi
export EDITOR=vim
alias vi="vim -p"

# OS specific commands
OS=${OSTYPE//[0-9.]/} # remove trailing version like in darwin9.0
if [[ "$OS" != 'darwin' ]]; then
  alias open="xdg-open"
fi

# Show me fortune at last
[ -z $1 ] && fortune

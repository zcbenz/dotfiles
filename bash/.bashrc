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

# Set variable identifying the chroot you work in.
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# kitten#1575:~$
if [[ "$OS" != 'cygwin' ]]; then
  PS1='${debian_chroot:+($debian_chroot)}\h#\!:\w\[\e[0;33m\]\[`tput bold`\]\$\[`tput rmso`\]\[\e[m\] '
fi

# I use vim!
set -o vi
export EDITOR=vim
alias vi="vim -p"

# Quick move between folders.
export MARKPATH=$HOME/.marks
function jump {
  cd -P $MARKPATH/$1 2> /dev/null || echo "No such mark: $1"
}
function mark {
  mkdir -p $MARKPATH; ln -s "$(pwd)" $MARKPATH/$1
}
function unmark {
  rm -i $MARKPATH/$1
}
function marks {
  (t="$(printf "\t")"; cd $MARKPATH && stat -f"%N$t%SY" * | column -ts"$t")
}
function _jump {
  local cur=${COMP_WORDS[COMP_CWORD]}
  local marks=$(find $MARKPATH -type l | awk -F '/' '{print $NF}')
  COMPREPLY=($(compgen -W '${marks[@]}' -- "$cur"))
  return 0
}
complete -o default -o nospace -F _jump jump

# OS specific commands
if [[ $OS == 'darwin' ]]; then
  export PATH=~/bin/darwin:/usr/local/sbin:/usr/local/bin:$PATH
elif [[ $OS == 'linux-gnu' ]]; then
  source /usr/share/autojump/autojump.sh
  alias open="xdg-open"
elif [[ $OS == 'cygwin' ]]; then
  alias open="cygstart"
  alias ls="ls --color"
  alias ahk="/cygdrive/c/Program\ Files/AutoHotkey/AutoHotkey.exe"
  alias npm="npm.cmd"
  export LC_ALL='en_US.UTF-8'
fi

# Import secrect environments
if [ -e "$HOME/bin/set-env" ]; then
  source "$HOME/bin/set-env"
fi

# Show me fortune at last
[ -z $1 ] && fortune

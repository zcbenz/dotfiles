#!/bin/bash

# Extra tools
source ~/.tools_aliases

# Suppress the zsh warning
export BASH_SILENCE_DEPRECATION_WARNING=1

# Bash settings
export CLICOLOR=1
export HISTSIZE=3000
export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT='%F %T '
shopt -s histappend
shopt -s checkwinsize

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
if [[ $OS == 'linux-gnu' ]]; then
  source /usr/share/autojump/autojump.sh
elif [[ $OS == 'cygwin' ]]; then
  export LC_ALL='en_US.UTF-8'
  # Force UTF-8 code page.
  chcp.com 437 > /dev/null
fi

# Import secrect environments
if [ -e "$HOME/bin/set-env" ]; then
  source "$HOME/bin/set-env"
fi

# Show me fortune at last
[ -z $1 ] && fortune

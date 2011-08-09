# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
export EDITOR=/usr/local/bin/vim
#export EDITOR=/usr/bin/mcedit

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=news.kc.sbcglobal.net

# If you want to use a Palm device with Linux, uncomment the two lines below.
# For some (older) Palm Pilots, you might need to set a lower baud rate
# e.g. 57600 or 38400; lowest is 9600 (very slow!)
#
#export PILOTPORT=/dev/pilot
#export PILOTRATE=115200

test -s ~/.alias && . ~/.alias || true

#  the following will hopefully correct the default 'ls -A' sort so 
#  dotted items will come before non-dotted ones
export LC_COLLATE=POSIX

#export PS1='\[\e[6;31m\][$(date "+%a %H:%M")] \w $\[\e[m\] '
#  export PS1='[\d \A] \w> '
#  export PS1='[$(mytime)] \w $ '
#  export PS1='\[\e[6;31m\][$(mytime)] \w $\[\e[m\] '
#  export PS1='\[\e[6;31m\]\w $\[\e[m\] '
#  export PS1='\[\e[6;31m\]$\[\e[m\] '
#  export PS1='[$(date "+%a %H:%M")] \w $ '
#  export PS1='$ '
export PS1='\w> '
#  export PS1='$PWD> '

alias cd2='cd ~/bin'
alias cd3='cd ~/txt'
alias cd33='cd ~/txt/ranger'
alias cd34='cd ~/txt/retire'
alias cd35='cd ~/txt/roadstar'
alias cd4='cd ~/py'
alias cd44='cd ~/py/primes'
alias cd5='cd ~/tcl'
alias cd55='cd ~/tcl/primes'
alias cd6='cd ~/.vim'
alias cd66='cd ~/.vim-tmp'
alias cd7='cd ~/.build/vim'
alias cd77='cd ~/.build/vim/vim/src'
alias cd8='cd ~/forftp'
alias cdd='cd /usr/local/share/vim/vim73/doc'
alias cdf='cd ~/txt/f'
alias cdp='cd ~/perl'
alias cdpp='cd ~/perl/primes'
alias cdr='cd /usr/local/share/vim/vim73'
alias cdt='cd ~/toothpik-s-.vimrc'
alias cdtt='cd ~/toothpik.github.com'
alias ....='cd ../../..'
alias l='ls -AgGl --group-directories-first'

export TERM=xterm-256color

#  dangerous path extension of %PWD
function dp () {
if [[ $PATH = $PWD:* ]]
then
    echo "PATH already has $PWD"
else
    export PATH=${PWD}:$PATH
fi
}
#  remove dangerous path extension -- whew!
function rdp () {
export PATH=${PATH#$PWD:}
}
function vb () {
v ~/.bashrc
}
function sourceb () {
. ~/.bashrc
}


function extract()      # Handy Extract Program.
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

function vman() { man "$@" | col -bx | iconv -c | vim -c 'set ft=man nomod nolist' -; }
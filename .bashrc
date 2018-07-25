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

###############################################################
#  when changing PS1 be sure to also change dp and rdp to     #
#  stay in sync                                               #
###############################################################
#  export PS1='\[\e[6;31m\][$(date "+%a %H:%M")] \w $\[\e[m\] '
#  export PS1='[\d \A] \w> '
#  export PS1='[$(mytime)] \w $ '
#  export PS1='\[\e[6;31m\][$(mytime)] \w $\[\e[m\] '
#  export PS1='\[\e[6;31m\]\w $\[\e[m\] '
#  export PS1='\[\e[6;31m\]$\[\e[m\] '
#  export PS1='$(date "+%a %H:%M") \w> '
export PS1='[$(date "+%a %H:%M")] \w> '
#  export PS1='$ '
#  export PS1='\w> '
#  export PS1='$PWD> '
#  export PS1='\w$ '


alias cd2='cd ~/bin'
alias cd33='cd ~/txt/ranger'
alias cd34='cd ~/txt/retire'
alias cd35='cd ~/txt/roadstar'
alias cd3='cd ~/txt'
alias cd44='cd ~/py/primes'
alias cd4='cd ~/py'
alias cd55='cd ~/tcl/primes'
alias cd5='cd ~/tcl'
alias cd66='cd ~/.vim-tmp'
alias cd6='cd ~/.vim'
alias cd7='cd ~/.build/vim'
alias cd76='cd ~/.build/vim/vim'
alias cd77='cd ~/.build/vim/vim/src'
alias cda='cd ~/awk'
alias cdb='cd ~/bin-mail'
alias cdc='cd ~/calc'
alias cdcp='cd ~/calc/primes'
alias cdd='cd /usr/local/share/vim/vim81/doc'
alias cde='cd ~/txt/escape'
alias cdf='cd ~/txt/f'
alias cdg2='cd $(~/txt/f/gcsd)'
alias cdg='cd ~/txt/roadglide'
alias cdk='cd ~/txt/roadking'
alias cdm='cd ~/Mail'
alias cdp='cd ~/perl'
alias cdpp='cd ~/perl/primes'
alias cdr='cd /usr/local/share/vim/vim81'
alias cdt='cd ~/toothpik-s-.vimrc'
alias cdtt='cd ~/toothpik.github.com'
alias cdvt='cd ~/.vim-tmp'
alias pf='sudo /usr/sbin/postfix'
alias ssie='sudo /sbin/ifstatus eth0'

export TERM=xterm-256color

#  2014-Apr-24  recommended from ~/.xsession-errors
#export __GL_YIELD="USLEEP"
#  we may come back to this, but for now it was no help

#  for vidir:
export VIDIR_EDITOR=vim
#export VIDIR_EDITOR_ARGS='-c :set nolist | :set ft=vidir-ls'
#export VIDIR_EDITOR_ARGS='-c :set ft=vidir-ls'

#  for mutt:
export COLORFGBG="default;default"

#  dangerous path extension of %PWD
dp () {
    if [[ $PATH = $PWD:* ]]
    then
        echo "PATH already has $PWD"
        export PS1='[$(date "+%a %H:%M")] \w: '
    else
        export PATH=${PWD}:${PATH}
        export PS1='[$(date "+%a %H:%M")] \w: '
    fi
}
#  remove dangerous path -- whew!
rdp () {
    if [[ $PATH = $PWD:* ]]
    then
        export PATH=${PATH#$PWD:}
        export PS1='[$(date "+%a %H:%M")] \w> '
    else
        echo "PATH doesn't have $PWD at the front"
        export PS1='[$(date "+%a %H:%M")] \w> '
    fi
}
vb () {
    v ~/.bashrc
}
sb () {
    . ~/.bashrc
}


extract()      # Handy Extract Program.
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

vman() { man "$@" 2>&1 | col -bx | iconv -c | vim -c 'set ft=man nomod nolist nonu nornu' -c 'call Hideme()' -; }
gman() { man "$@" 2>&1 | col -bx | iconv -c | gvim -geometry 85x42 -c 'set ft=man nomod nolist nonu nornu' -c 'call Hideme()' -; }

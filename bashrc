

# Source global definitions
[[ -f /etc/bash.bashrc ]] && source /etc/bash.bashrc

# Colors.
BLACK='\e[0;30m'
RED='\e[0;31m'
GREEN='\e[0;32m'
YELLOW='\e[0;33m'
BLUE='\e[0;34m'
PURPLE='\e[0;35m'
CYAN='\e[0;36m'
WHITE='\e[0;37m'
NO_COLOR='\e[m'

# -------------------------[ Alias ]-----------------------
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias c='echo -e "\033[?6c"'
alias grep='grep --color=auto'
alias vi='vim'
alias ls='ls -F'
alias ls='ls -G'

# Some alias from C shell.
alias h='history 20'
alias greenterm='setterm -foreground green -store'
alias whiteterm='setterm -foreground white -store'
alias irb='irb --simple-prompt'

# User specific aliases and functions

#[[ $TERM == 'screen' ]] && export LANG=C

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export HISTSIZE=10000
export HISTTIMEFORMAT='%D %T '
export PS1="\[${GREEN}\]\u \W \$ \[${NO_COLOR}\]"
export EDITOR='vi'

# For 'ls' color.
#export CLICOLOR=1
#export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# run fetchmail on startup.
#[[ $(pidof fetchmail) ]] || fetchmail -d 300

#umask 022

# MacPorts Installer addition on 2014-03-09_at_10:17:51: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/X11/bin:/opt/local/sbin:/Users/tim/bin:$PATH



# Source global definitions.
[[ -r /etc/bash.bashrc ]] && source /etc/bash.bashrc
# Maybe bash_completion should not be source here.
#[[ -r /etc/bash_completion ]] && source /etc/bash_completion

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
alias ls='ls --color=tty -F'
alias ll='ls -l'
alias la='ls -a'

alias lynx='lynx --accept_all_cookies'
alias mpv='mpv --save-position-on-quit --no-audio-display'
alias emacs='emacs -nw'
alias irb='irb --simple-prompt'

# Some alias from C shell.
alias h='history 20'
alias greenterm='setterm -foreground green -store'
alias whiteterm='setterm -foreground white -store'

[[ $TERM == 'linux' ]] && c

export HISTSIZE=10000
export HISTTIMEFORMAT='%D %T '
export PS1="\[${GREEN}\][\u@\h \w]\$ \[${NO_COLOR}\]"
export EDITOR='vi'
export PAGER='less'

export LC_ALL=en_US.UTF-8

# For 'ls' color.
#export CLICOLOR=1
#export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# run fetchmail on startup.
#[[ $(pidof fetchmail) ]] || fetchmail -d 300

#umask 022

export PATH=$PATH:/sbin:/usr/sbin:/home/tim/bin
export PYTHONPATH=$PYTHONPATH:/home/tim/scripts/python/

# Release 'stty' bind 'ctrl-s', 'ctrl-q'.
stty stop undef
stty start undef

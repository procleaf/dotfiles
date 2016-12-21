
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

LIGHT_CYAN=$'\e[1;36m' # light cyan
LIGHT_GREEN=$'\e[1;32m' # green text

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

alias h='history 20'
alias greenterm='setterm -foreground green -store'
alias whiteterm='setterm -foreground white -store'

# Set full block blinking cursor in console.
[[ $TERM == 'linux' ]] && c

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# Complete after sudo
complete -cf sudo
# Complete after man
complete -cf man


# enable zsh like auto nd 'set show-all-if-ambiguous on'
bind 'set show-all-if-ambiguous on'
#bind 'TAB:menu-complete'

export HISTSIZE=100000
export HISTFILESIZE=20000
export HISTTIMEFORMAT='%D %T '
export PS1="\[${GREEN}\][\u@\h \W]\$ \[${NO_COLOR}\]"
export EDITOR='vi'
export PAGER='less -X'
export MAIL="~/Mail/inbox"
# Don’t clear the screen after quitting a manual page.  Doesn't work well with
# GNU screen.
#export MANPAGER='less -X';

export LC_ALL=en_US.UTF-8

# For 'ls' color.
#export CLICOLOR=1
#export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# run fetchmail on startup.
[[ $(pidof fetchmail) ]] || fetchmail -d 60

#umask 022

export PATH=$PATH:/sbin:/usr/sbin:$HOME/bin
export PYTHONPATH=$PYTHONPATH:$HOME/scripts/python/

[ -r ~/.dir_colors ] && eval `dircolors ~/.dir_colors`

# Release 'stty' bind 'ctrl-s', 'ctrl-q'.
stty stop undef
stty start undef

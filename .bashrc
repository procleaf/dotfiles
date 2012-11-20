
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

NSN_LAB_PROXY='http://192.168.2.23:3128/'

ch_proxy () {
    export http_proxy="${NSN_LAB_PROXY}"
    export https_proxy="${NSN_LAB_PROXY}"
}

export PS1="\[${CYAN}\]\u \W |\[${NO_COLOR}\] "
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTTIMEFORMAT='%D %T '

# For Android.
export PATH=$PATH:~/android-sdk-linux/tools:~/android-sdk-linux/platform-tools
export JAVA_HOME="/opt/jdk1.7.0_09"
export PATH=$PATH:$JAVA_HOME/bin

# no proxy hosts.
export no_proxy=localhost,10.68.0.0/16,10.56.0.0/16,10.140.0.0/16

# -----------------------------[ Alias ] -----------------------------
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls -F --color=tty'
alias ll='ls -l'
alias la='ls -a'
alias grep='grep --color=auto'

alias c='echo -e "\033[?6c"'

alias greenterm='setterm -foreground green -store'
alias whiteterm='setterm -foreground white -store'

alias irb='irb --simple-prompt'

# Change to blink cursor on console login.
[[ ${TERM} == 'linux' ]] && c

[[ ${TERM} == 'screen' ]] && export LANG=C

# Start fetchmail at login.
[[ ! -f ~/.fetchmail.pid && ! -z ${PS1} ]] && fetchmail -d 300


umask 022

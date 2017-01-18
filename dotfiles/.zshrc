# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="random"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#
# as this is getting to be called too often.
#
chk_cmd () {
    command -v "$1" > /dev/null 2>&1 && return 0 || return 1
}

alias c='echo -e "\033[?6c"'
alias cp='cp -i'
alias emacs='emacs -nw'
alias greenterm='setterm -foreground green -store'
alias whiteterm='setterm -foreground white -store'
alias grep='grep --color=auto'
alias h='history 20'
alias irb='irb --simple-prompt'
alias ls='ls --color=auto -F'
alias la='ls -a'
alias ll='ls -l'
alias lynx='lynx --accept_all_cookies'
alias mpv='mpv --save-position-on-quit --no-audio-display'
alias mv='mv -i'
alias rm='rm -i'
alias vi='vim'

if [[ $OSTYPE =~ ^darwin ]] ; then
    export PATH="/opt/local/bin:/opt/local/sbin:/Users/tim/bin:/opt/local/libexec/gnubin:$PATH"
    alias file='file -h'
    plugins+="osx"
elif [[ $OSTYPE =~ ^freebsd ]] ; then
    alias ls='\ls -F -G'
elif [[ -e "/etc/os-release" ]] ; then
    plugins+="debian"
fi

chk_cmd "dircolors" && eval `dircolors ~/.dir_colors`

export LC_ALL=en_US.UTF-8
# Man page color.
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;016m\E[48;5;220m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

export PATH="/usr/sbin:/sbin:$HOME/bin:$PATH"

export PYTHONPATH="$HOME/automation_git/TIS-RAT"

# start fetchmail in background if:
#  - fetchmail is installed.
#  - ~/.fetchmailrc is present & readable.
#  - fetchmail is not running already.
(chk_cmd "fetchmail" && [[ -r ~/.fetchmailrc ]]) && \
    (pgrep fetchmail > /dev/null 2>&1 || fetchmail -d 30 -L ~/.fetchmail.log)

# shows a full block blinking cursor on login(?) on linux console.
[[ $TERM == 'linux' ]] && c || : # see 'alias' for 'c'.

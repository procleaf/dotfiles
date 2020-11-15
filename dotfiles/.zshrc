autoload -U colors && colors
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

#
# as this is getting to be called too often.
#
chk_cmd () {
    command -v "$1" > /dev/null 2>&1 && return 0 || return 1
}

# starts a full block blinking cursor.
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
alias less='less -X -N'

chk_cmd "dircolors" && [[ -r ~/.dir_colors ]] && \
    eval `dircolors ~/.dir_colors`

export LC_ALL=en_US.UTF-8


setopt INC_APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
setopt -o emacs
#setopt -o sharehistory

export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000
export HISTTIMEFORMAT='[%F %T]'

export SHAMI="$HOME/shami"
export SHAMI_C='/home/qye/codes/c/shami'
export PYTHONPATH=$PYTHONPATH:$(dirname "${SHAMI}")

export PS1="%{$fg[cyan]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "

#export PATH="/usr/sbin:/sbin:$HOME/bin:$HOME/.gem/ruby/2.6.0/bin:$PATH"
export PAGER='less -X'
export EDITOR='vim'

# shows a full block blinking cursor on login(?) on linux console.
[[ $TERM == 'linux' ]] && c # see 'alias' for 'c'.

function backward-kill-partial-word {
    local WORDCHARS="${WORDCHARS//[\/.]/}"
    zle backward-kill-word "$@"
}
zle -N backward-kill-partial-word
for x in '^Xw' '^[^?' '^[^H'; do
    bindkey "$x" backward-kill-partial-word
done; unset x

case $(uname -s) in
    Linux)
        # Man page color.
        export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
        export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
        export LESS_TERMCAP_me=$'\E[0m'           # end mode
        export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
        export LESS_TERMCAP_so=$'\E[38;5;016m\E[48;5;220m'    # begin standout-mode - info box
        export LESS_TERMCAP_ue=$'\E[0m'           # end underline
        export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline
        export PATH="$HOME/bin:/sbin:/usr/sbin:/usr/local/sbin:$PATH"
        ;;
    FreeBSD) alias ls='\ls -F -G'
             export MANWIDTH="tty";;
    Darwin) alias ls='\ls -F -G'
            export MANPATH="/opt/local/share/man:$MANPATH"
            export PATH="/opt/local/bin:/opt/local/sbin:${HOME}/bin:/opt/local/libexec/gnubin:$PATH"
            alias file='file -h'
            plugins+="osx"
            ;;
    OpenBSD) alias ls='\ls -F'
             unalias grep;;
esac

# arch based distro.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null || \
    # debian based distro.
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

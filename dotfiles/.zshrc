# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

COMPLETION_WAITING_DOTS="true"

 # fix tmux utf8 detection
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# starting shell from ssh and tmux is not running
if [[ -n $SSH_CONNECTION && -z "$TMUX" ]]; then
    echo "autostarting tmux"

    ZSH_TMUX_AUTOSTART=true
    ZSH_TMUX_AUTOCONNECT=true
fi

plugins=(git osx tmux brew lein rsync colored-man history-substring-search extract cabal bower node npm stack)

# Customize to your needs...
export PATH=~/bin:~/Library/Haskell/bin:/usr/local/bin:/usr/local/sbin:$PATH:.

# https://github.com/bhilburn/powerlevel9k/wiki/Show-Off-Your-Config#mavams-configuration
# Nerd Fonts (Meslo): https://github.com/ryanoasis/nerd-fonts

POWERLEVEL9K_MODE='nerdfont-complete'
#POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
#POWERLEVEL9K_SHORTEN_DELIMITER=""
#POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=''
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{blue}\u256D\u2500%F{white}"
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%F{blue}\u2570\uf460%F{white} "
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator dir dir_writable_joined)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time
                                    vcs background_jobs_joined time_joined)
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="clear"
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="clear"
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="yellow"
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="yellow"
POWERLEVEL9K_DIR_HOME_BACKGROUND="clear"
POWERLEVEL9K_DIR_HOME_FOREGROUND="blue"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="clear"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="blue"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="clear"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="red"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="clear"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"
POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND="red"
POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND="white"
POWERLEVEL9K_STATUS_OK_BACKGROUND="clear"
POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="clear"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"
POWERLEVEL9K_TIME_BACKGROUND="clear"
POWERLEVEL9K_TIME_FOREGROUND="cyan"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='clear'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='magenta'
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND='clear'
POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND='green'

ZSH_THEME="powerlevel9k/powerlevel9k"
source $ZSH/oh-my-zsh.sh

export LESSCHARSET='utf-8'

ZSH_SYNTAX_HIGHLIGHT_PATH=~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
if [[ -f $ZSH_SYNTAX_HIGHLIGHT_PATH ]];
then
    source $ZSH_SYNTAX_HIGHLIGHT_PATH
fi

# osx gui emacs? recommended: brew install emacs --cocoa --srgb
export EMACS_SERVER="default"
ec()  { emacsclient -s $EMACS_SERVER -a "" -n -c "$@" &! }
eco() { emacsclient -s $EMACS_SERVER -a "" -n "$@" &! }
ecd() { emacsclient -s $EMACS_SERVER -a "" -n -c "$@" & }
ect() { emacsclient -s $EMACS_SERVER -a "" -t "$@" ; }
eck() { emacsclient -s $EMACS_SERVER -e "(kill-emacs 0)"; }

export EDITOR='emacsclient -s $EMACS_SERVER -c -t -a ""'
alias E='SUDO_EDITOR="emacsclient -s $EMACS_SERVER -t -a emacs" sudoedit'

alias reload-zshrc='. ~/.zshrc'
alias youtube-download='youtube-dl -t -i'
alias ytd='youtube-download'
alias subs='LC_CTYPE="en" subliminal -l en'
alias opensubs='subs --service opensubtitles'
alias synchronize='rsync -WavP --ignore-existing'

alias gs='git st'
alias gci='git ci'
alias gcia='git cia'

alias ..='cd ..'
alias ...='cd ../..'
alias .-='cd -'

if (( $+commands[stack] ));
then
    export PATH=`stack path --local-bin`:$PATH
fi

if (( $+commands[exa] ));
then
    alias ls="exa -bghHlm --group-directories-first"
    alias l="exa"
    alias tree="exa -bghHlmT"
fi


# http://brettterpstra.com/2011/09/25/quick-tip-some-inputrc-fun/
# C-w performs filename rubout
if [ -t 0 ]; then
    stty stop undef
    stty werase undef
fi

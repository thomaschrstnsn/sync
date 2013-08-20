# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

source ~/.liquidprompt/liquidprompt

COMPLETION_WAITING_DOTS="true"

# starting shell from ssh and tmux is not running
if [[ -n $SSH_CONNECTION && -z "$TMUX" ]]; then
    echo "autostarting tmux"
    ZSH_TMUX_AUTOSTART=true
    ZSH_TMUX_AUTOCONNECT=true
fi

plugins=(git osx tmux brew lein rsync colored-man history-substring-search extract)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=~/bin:/usr/local/bin:/usr/local/sbin:$PATH:.

export LESSCHARSET='utf-8'

ZSH_SYNTAX_HIGHLIGHT_PATH=~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
if [[ -f $ZSH_SYNTAX_HIGHLIGHT_PATH ]];
then
    source $ZSH_SYNTAX_HIGHLIGHT_PATH
fi

APPLICATION_EMACS_APP='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient'
if [[ -x $APPLICATION_EMACS_APP ]];
then
    # osx gui emacs-daemon/client stuff
    # requires emacs >= 24 in path (for emacs-live) (e.g. script in ~/bin/)
    EC="$APPLICATION_EMACS_APP"

    ec()  { $EC -a "" -c "$@" &! }
    ecd() { $EC -a "" -c "$@" & }
    ect() { $EC -t -a ""; }
    eck() { $EC -e "(kill-emacs 0)"; }

    export EDITOR="$EC -c -a \"\""
    alias E="SUDO_EDITOR=\"$EC -t -a emacs\" sudoedit"
else
    ec()  { emacsclient -a "" -t "$@"}
    eck() { emacsclient -e "(kill-emacs 0)"; }

    export EDITOR="emacsclient -t -a \"\""
    alias E="SUDO_EDITOR=\"emacsclient -t -a emacs\" sudoedit"
fi

alias reload-zshrc='. ~/.zshrc'
alias youtube-download='youtube-dl -t'
alias subs='LC_CTYPE="en" subliminal -l en'
alias opensubs='subs --service opensubtitles'
alias synchronize='rsync -WavP --ignore-existing'

alias gs='git st'
alias gci='git ci'
alias gcia='git cia'

alias ..='cd ..'
alias ...='cd ../..'
alias .-='cd -'

# datomic
alias datomic-free=$HOME/.datomic-free/bin/datomic-free

# http://brettterpstra.com/2011/09/25/quick-tip-some-inputrc-fun/
# C-w performs filename rubout
if [ -t 0 ]; then
    stty stop undef
    stty werase undef
fi

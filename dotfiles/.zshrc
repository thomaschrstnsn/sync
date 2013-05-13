# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

source ~/.liquidprompt/liquidprompt

COMPLETION_WAITING_DOTS="true"

plugins=(git osx tmux)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=~/bin:/usr/local/bin:/usr/local/sbin:$PATH:.

export LESSCHARSET='utf-8'

APPLICATION_EMACS_APP='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient'
if [[ -x $APPLICATION_EMACS_APP ]];
then
    # osx gui emacs-daemon/client stuff
    # requires emacs >= 24 in path (for emacs-live) (e.g. script in ~/bin/)
    EC="$APPLICATION_EMACS_APP"

    ec()  { $EC -a "" -c "$@" & }
    ect() { $EC -t -a ""; }
    eck() { $EC -e "(kill-emacs 0)"; }

    export EDITOR="$EC -t -a \"\""
    alias E="SUDO_EDITOR=\"$EC -t -a emacs\" sudoedit"
else
    ec()  { emacsclient -a "" -t "$@"}
    eck() { emacsclient -e "(kill-emacs 0)"; }

    export EDITOR="emacsclient -t -a \"\""
    alias E="SUDO_EDITOR=\"emacsclient -t -a emacs\" sudoedit"
fi

bindkey '^[[A' history-beginning-search-backward # Up
bindkey '^[[B' history-beginning-search-forward # Down

alias youtube-download='youtube-dl -t'
alias subs='LC_CTYPE="en" subliminal -l en'
alias opensubs='subs --service opensubtitles'
alias synchronize='rsync -WavP --ignore-existing'

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

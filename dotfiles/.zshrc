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

plugins=(git osx tmux brew lein rsync colored-man history-substring-search extract)

# Customize to your needs...
export PATH=~/bin:/usr/local/bin:/usr/local/sbin:$PATH:.

# mac powerline
if [ -d /Users/thomas/Library/Python/2.7/lib/python/site-packages/powerline/bindings/zsh ]; then
    source $ZSH/oh-my-zsh.sh
    export PATH=$PATH:~/Library/Python/2.7/bin
    source "/Users/thomas/Library/Python/2.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh"
elif [ -d ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh ]; then
    source $ZSH/oh-my-zsh.sh
    export PATH=$PATH:~/.local/bin
    source ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
# fallback
else
    ZSH_THEME=tjkirch
    source $ZSH/oh-my-zsh.sh
fi

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

export EDITOR='emacsclient -s $EMACS_SERVER -c -a ""'
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

# datomic
alias datomic-free=$HOME/.datomic-free/bin/datomic-free

# http://brettterpstra.com/2011/09/25/quick-tip-some-inputrc-fun/
# C-w performs filename rubout
if [ -t 0 ]; then
    stty stop undef
    stty werase undef
fi

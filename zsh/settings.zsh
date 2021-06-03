# Env Variables
EDITOR='vim'
GIT_EDITOR='vim'

# History
HISTSIZE=100000
HISTFILE="$HOME/.zsh_history"
SAVEHIST=$HISTSIZE
HISTORY_IGNORE="(clear|cd|cd -|cd ..|cd ../|exit|* --help|ls|l|ll|lla|e)"

setopt appendhistory
setopt incappendhistory
setopt sharehistory
setopt histreduceblanks
setopt histignorespace
setopt histignorealldups
setopt histfindnodups

setopt autocd
setopt vi
setopt interactivecomments

# to avoid weird delete key behaviour due to vi mode
bindkey "^?" backward-delete-char

# Use incremental search
bindkey "^R" history-incremental-search-backward

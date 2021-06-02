# ls aliases

if [ "$(uname)" = "Darwin" ]; then
    # MacOS
    alias ls="ls -G"       
elif [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
    # Linux
    alias ls="ls --color=auto"
fi

alias la="ls -A"
alias ll="ls -lh"
alias lla="ll -A"
alias l="ls"

# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

# Others
alias v="vim"
alias e="exit"
alias mkdir="mkdir -p"
alias df="df -h"
alias grep="grep --color"
# Git aliases
alias gs="git status"
alias gc="git commit"
alias gpom="git push origin master"
alias gco="git checkout"
alias ga="git add -A"
alias gundo="git restore --staged"
alias glog="git log --all --graph --decorate"
alias gpull="git pull --ff-only"

# Go up [n] directories
up()
{
    local cdir="$(pwd)"
    if [[ "${1}" == "" ]]; then
        cdir="$(dirname "${cdir}")"
    elif ! [[ "${1}" =~ ^[0-9]+$ ]]; then
        echo "Error: argument must be a number"
    elif ! [[ "${1}" -gt "0" ]]; then
        echo "Error: argument must be positive"
    else
        for ((i=0; i<${1}; i++)); do
            local ncdir="$(dirname "${cdir}")"
            if [[ "${cdir}" == "${ncdir}" ]]; then
                break
            else
                cdir="${ncdir}"
            fi
        done
    fi
    cd "${cdir}"
}

dfu() {
    (
        cd ~/.dotfiles && git pull --ff-only && ./install -q
    )
}

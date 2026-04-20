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
v() {
  if [ $# -eq 0 ]; then
    local files=$(fzf --preview 'bat --color=always --line-range :200 {} 2>/dev/null || cat {}')
    [ -n "$files" ] && vim $files
  else
    vim "$@"
  fi
}
alias e="exit"
# Interactive cd — c opens fzf directory picker, c <dir> works normally
c() {
  if [ $# -eq 0 ]; then
    local dir=$(fd --type d --hidden --exclude .git 2>/dev/null | fzf --preview 'ls -1A --color=always {}')
    [ -n "$dir" ] && cd "$dir"
  else
    cd "$@"
  fi
}
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
glog() {
  git log --all --graph --decorate --oneline --color=always --format='%C(auto)%h%d %s %C(dim)%an, %ar' |
    fzf --ansi --no-sort --preview 'git show --color=always $(echo {} | grep -o "[a-f0-9]\{7,\}" | head -1)' \
        --bind 'enter:execute(git show --color=always $(echo {} | grep -o "[a-f0-9]\{7,\}" | head -1) | less -R)' \
        --preview-window=right:60%
}
alias gpull="git pull --ff-only"
alias gdiff="git diff"

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
        cd ~/.dotfiles && git pull --ff-only && ./install -q && source ~/.zshrc
	echo "sourced ~/.zshrc"
    )
}

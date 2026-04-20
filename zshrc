
# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/.local/share/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/.local/share/kiro-cli/shell/zshrc.pre.zsh"

# ZSH Autosuggestion
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=162'
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=154"
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=226"
autoload -Uz compinit && compinit -i
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Pure Prompt Terminal
fpath+=("$(brew --prefix)/share/zsh/site-functions")
PURE_CMD_MAX_EXEC_TIME=10
autoload -Uz promptinit; promptinit
prompt pure

source ~/.zsh/settings.zsh
source ~/.shell/aliases.sh

bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi

# fzf keybindings and completion
export FZF_COMPLETION_OPTS="--preview 'bat --color=always --line-range :200 {} 2>/dev/null || ls -1A --color=always {}'"
source <(fzf --zsh)

# c <TAB> triggers fzf directory picker
_fzf_complete_c() {
  _fzf_complete --preview 'ls -1A --color=always {}' -- "$@" < <(fd --type d --hidden --exclude .git 2>/dev/null)
}
_fzf_complete_c_post() { awk '{print $1}'; }


# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/.local/share/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/.local/share/kiro-cli/shell/zshrc.post.zsh"

# Set up mise for runtime management
eval "$(/home/shrimaa/.local/bin/mise activate zsh)"
source ~/.local/share/mise/completions.zsh
alias finch='sudo HOME=/home/shrimaa DOCKER_CONFIG=/home/shrimaa/.docker finch'

# ZSH Autosuggestion
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
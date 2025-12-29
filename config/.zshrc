#------------------------------------------------------
# Oh My Zsh installation
#------------------------------------------------------

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

source $ZSH/oh-my-zsh.sh

#------------------------------------------------------
# Aliases
#------------------------------------------------------
alias serve='python -m http.server'
alias de='setxkbmap de'
alias us='setxkbmap us'
alias lnks='~/.bookmarks/lnks.sh'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../../'

alias ls="ls --color=auto"
alias ll="ls -asl"
alias clc="clear"
alias seek="ssh ant@host"

#------------------------------------------------------
# fd settings
#------------------------------------------------------
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}
# --- setup fzf theme ---
fg="#CBE0F0"
bg="#011628"
bg_highlight="#143652"
purple="#B388FF"
blue="#06BCE4"
cyan="#2CF9ED"
export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"
eval "$(fzf --zsh)"
#------------------------------------------------------
# PATH
#------------------------------------------------------
path_add() {
  [[ -d "$1" ]] && PATH="$1:$PATH"
}

path_add "$HOME/Library/Python/3.9/bin"
path_add "/opt/homebrew/opt/node@22/bin"

export PATH

bindkey '^I' autosuggest-accept

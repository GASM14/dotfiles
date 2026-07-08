# Starship prompt
eval "$(starship init zsh)"

# Vi-mode (navegação estilo Vim) - CORRIGIDO
bindkey -v
export KEYTIMEOUT=1

# Atalho para sair do modo insert (jk)
bindkey 'jk' vi-cmd-mode

# Forçar o Starship a atualizar o prompt ao mudar de modo
function zle-keymap-select {
    zle reset-prompt
}
zle -N zle-keymap-select

# Plugins Zsh
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# (Opcional) Alias úteis
alias ll='ls -la'
alias ..='cd ..'

export GHOSTTY_CONFIG="$HOME/.config/ghostty"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY

# Alternativas modernas
alias ls='eza --icons'
alias ll='eza -l --icons'
alias la='eza -la --icons'
alias tree='eza --tree --icons'
alias cat='batcat'
alias find='fdfind'
alias grep='rg'

# Navegação
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Zoxide (cd inteligente)
eval "$(zoxide init zsh)"

# History substring search
source ~/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Git
alias g='git'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gs='git status'
alias gd='git diff'
alias gl='git log --oneline --graph'
alias lg='lazygit'

# Docker (se usar)
alias d='docker'
alias dc='docker-compose'

# Sistema
alias update='sudo apt update && sudo apt upgrade -y'
alias clean='sudo apt autoremove -y && sudo apt autoclean'
alias reload='exec zsh'

# FZF
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"

alias update-dotfiles='~/dotfiles/scripts/update.sh'

alias zj='zellij'

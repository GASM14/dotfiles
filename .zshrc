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
# Alias cat -> bat (Fedora) ou batcat (Debian)
if command -v batcat &> /dev/null; then
    alias cat='batcat'
elif command -v bat &> /dev/null; then
    alias cat='bat'
else
    alias cat='cat'
fi

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

# FZF (usa scripts locais ~/.fzf/shell)
if [ -f ~/.fzf/shell/key-bindings.zsh ]; then
    source ~/.fzf/shell/key-bindings.zsh
    source ~/.fzf/shell/completion.zsh
else
    echo "Aviso: integração do fzf não encontrada. Execute ~/.fzf/install"
fi

# Atalhos para sair do modo insert
bindkey 'jk' vi-cmd-mode 

alias update-dotfiles='~/dotfiles/scripts/update.sh'

alias zj='zellij'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

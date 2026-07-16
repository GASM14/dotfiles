# PATH local
export PATH="$HOME/.local/bin:$PATH"

# Starship prompt
eval "$(starship init zsh)"

# Vi-mode (navegação estilo Vim)
bindkey -v
export KEYTIMEOUT=1
bindkey 'jk' vi-cmd-mode

function zle-keymap-select {
    zle reset-prompt
}
zle -N zle-keymap-select

# Plugins Zsh
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Aliases base
alias ll='ls -la'
alias ..='cd ..'

export GHOSTTY_CONFIG="$HOME/.config/ghostty"

# Histórico
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
alias find='fdfind'
alias grep='rg'

# Aliases condicionais para cat/bat (funciona em Debian e Fedora)
if command -v batcat &> /dev/null; then
    alias cat='batcat --paging=never'
    alias bat='batcat'
elif command -v bat &> /dev/null; then
    alias cat='bat --paging=never'
    alias bat='bat'
else
    alias cat='cat'
    alias bat='cat'
fi

# Navegação
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Zoxide
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

# Docker
alias d='docker'
alias dc='docker-compose'

# Sistema
alias update='sudo apt update && sudo apt upgrade -y'
alias clean='sudo apt autoremove -y && sudo apt autoclean'
alias reload='exec zsh'

# FZF (procura em vários locais)
if [ -f ~/.fzf/shell/key-bindings.zsh ]; then
    source ~/.fzf/shell/key-bindings.zsh
    source ~/.fzf/shell/completion.zsh
elif [ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]; then
    source /usr/share/doc/fzf/examples/key-bindings.zsh
    source /usr/share/doc/fzf/examples/completion.zsh
elif [ -f /usr/share/fzf/shell/key-bindings.zsh ]; then
    source /usr/share/fzf/shell/key-bindings.zsh
    source /usr/share/fzf/shell/completion.zsh
fi
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"

# Atalhos
bindkey 'jk' vi-cmd-mode

# Aliases personalizados
alias update-dotfiles='~/dotfiles/scripts/update.sh'
alias zj='zellij'

# Carregar integração do fzf (se existir)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

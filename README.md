# Dotfiles – Ghostty + Zsh + Starship

Este repositório contém a minha configuração personalizada do terminal, usada no Mac mini M4 e no Parrot OS.

## Ferramentas incluídas

- **Shell**: Zsh
- **Terminal**: Ghostty
- **Prompt**: Starship (Catppuccin Powerline)
- **Plugins Zsh**:
  - zsh-autosuggestions
  - zsh-syntax-highlighting
  - zsh-history-substring-search
- **Utilitários**:
  - eza (`ls` moderno)
  - bat (`cat` com realce)
  - fd (`find` rápido)
  - ripgrep (`grep` rápido)
  - zoxide (`cd` inteligente)
  - fzf (pesquisa fuzzy)
  - lazygit (interface Git TUI)

## Instalação

**Linux (Debian/Parrot)**:

```bash
git clone https://github.com/seu-usuario/dotfiles.git
cd dotfiles
./scripts/install.sh

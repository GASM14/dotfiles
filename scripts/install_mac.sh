#!/bin/bash
set -e

echo "🍏 A instalar para macOS..."
# Instalar Homebrew se não tiver
if ! command -v brew &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Instalar dependências via Homebrew
brew install zsh git curl wget unzip eza bat fzf fd ripgrep starship

# Instalar Zoxide
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

# Instalar Lazygit
brew install lazygit

# Instalar plugins Zsh
mkdir -p ~/.zsh/plugins
[ -d ~/.zsh/plugins/zsh-autosuggestions ] || git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/plugins/zsh-autosuggestions
[ -d ~/.zsh/plugins/zsh-syntax-highlighting ] || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/plugins/zsh-syntax-highlighting
[ -d ~/.zsh/plugins/zsh-history-substring-search ] || git clone https://github.com/zsh-users/zsh-history-substring-search.git ~/.zsh/plugins/zsh-history-substring-search

# Criar links simbólicos (igual ao install.sh)
DOTFILES_DIR=$(pwd)
mkdir -p ~/.config/ghostty ~/.config/lazygit
ln -sf "$DOTFILES_DIR/.zshrc" ~/.zshrc
ln -sf "$DOTFILES_DIR/.config/ghostty/config" ~/.config/ghostty/config
ln -sf "$DOTFILES_DIR/.config/starship.toml" ~/.config/starship.toml
ln -sf "$DOTFILES_DIR/.config/lazygit/config.yml" ~/.config/lazygit/config.yml

# Mudar shell para Zsh
sudo chsh -s $(which zsh) $USER

echo "✅ Instalação macOS concluída! Reinicie a sessão ou execute 'exec zsh'."

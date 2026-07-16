#!/bin/bash
set -e

echo "🔧 A instalar dependências no Fedora/Nobara..."
sudo dnf install -y zsh git curl wget unzip eza bat fzf fd-find ripgrep

echo "📦 A instalar Starship..."
curl -sS https://starship.rs/install.sh | sh -s -- -y

echo "📦 A instalar Zoxide..."
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

echo "📦 A instalar Lazygit..."
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit lazygit.tar.gz

echo "📦 A instalar plugins Zsh..."
mkdir -p ~/.zsh/plugins
[ -d ~/.zsh/plugins/zsh-autosuggestions ] || git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/plugins/zsh-autosuggestions
[ -d ~/.zsh/plugins/zsh-syntax-highlighting ] || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/plugins/zsh-syntax-highlighting
[ -d ~/.zsh/plugins/zsh-history-substring-search ] || git clone https://github.com/zsh-users/zsh-history-substring-search.git ~/.zsh/plugins/zsh-history-substring-search

echo "🔗 A criar links simbólicos..."
DOTFILES_DIR=$(pwd)
mkdir -p ~/.config/ghostty ~/.config/lazygit
ln -sf "$DOTFILES_DIR/.zshrc" ~/.zshrc
ln -sf "$DOTFILES_DIR/.config/ghostty/config" ~/.config/ghostty/config
ln -sf "$DOTFILES_DIR/.config/starship.toml" ~/.config/starship.toml
ln -sf "$DOTFILES_DIR/.config/lazygit/config.yml" ~/.config/lazygit/config.yml

# Configurar tema do bat
mkdir -p ~/.config/bat/themes
curl -L https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme -o ~/.config/bat/themes/Catppuccin\ Mocha.tmTheme
bat cache --build

echo "🔄 A mudar shell para Zsh..."
sudo chsh -s $(which zsh) $USER

echo "✅ Instalação concluída! Reinicie a sessão ou execute 'exec zsh'."

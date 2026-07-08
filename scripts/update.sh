#!/bin/bash
echo "📦 A atualizar dotfiles..."
cd ~/dotfiles && git pull
./scripts/install.sh
echo "✅ Atualização concluída."

#!/usr/bin/env bash
set -eE

trap 'echo -e "\033[0;31mError on line $LINENO. Exiting.\033[0m" >&2; exit $?' ERR

ln -sf ~/.dotfiles/dotfiles/.bashrc_common.sh ~/.bashrc_common.sh
ln -sf ~/.dotfiles/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/dotfiles/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/dotfiles/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/dotfiles/.vimrc ~/.ideavimrc
ln -sf ~/.dotfiles/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/dotfiles/nvim/keymaps.lua ~/.config/nvim/lua/config/keymaps.lua
ln -sf ~/.dotfiles/dotfiles/nvim/options.lua ~/.config/nvim/lua/config/options.lua

echo -e "\033[0;32mAll links created successfully.\033[0m"

function create_symbolic_link() {
  rm -rf $2
  ln -s $1 $2
  echo "created link $2"
}

create_symbolic_link ~/.dotfiles/dotfiles/.tmux.conf ~/.tmux.conf
create_symbolic_link ~/.dotfiles/dotfiles/.zshrc ~/.zshrc
create_symbolic_link ~/.dotfiles/dotfiles/.vimrc ~/.vimrc
create_symbolic_link ~/.dotfiles/dotfiles/.gitconfig ~/.gitconfig
create_symbolic_link ~/.dotfiles/dotfiles/.vimrc ~/.ideavimrc
create_symbolic_link ~/.dotfiles/dotfiles/nvim/keymaps.lua ~/.config/nvim/lua/config/keymaps.lua
create_symbolic_link ~/.dotfiles/dotfiles/nvim/options.lua ~/.config/nvim/lua/config/options.lua

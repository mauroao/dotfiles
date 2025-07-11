function create_symbolic_link() {
  rm -rf $2
  ln -s $1 $2
  echo "created link $2"
}

function download_git_file() {
  rm -rf ~/."$1"
  curl --silent https://raw.githubusercontent.com/git/git/master/contrib/completion/"$1" --output ~/."$1"
  echo "downloaded $1"
}

function install_autosuggestions {
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions 2>/dev/null
}

create_symbolic_link ~/.dotfiles/dotfiles/.tmux.conf ~/.tmux.conf
create_symbolic_link ~/.dotfiles/dotfiles/.zshrc ~/.zshrc
create_symbolic_link ~/.dotfiles/dotfiles/.vimrc ~/.vimrc
create_symbolic_link ~/.dotfiles/dotfiles/.gitconfig ~/.gitconfig
create_symbolic_link ~/.dotfiles/dotfiles/.vimrc ~/.ideavimrc
create_symbolic_link ~/.dotfiles/dotfiles/nvim/keymaps.lua ~/.config/nvim/lua/config/keymaps.lua

# download_git_file "git-prompt.sh"
# install_autosuggestions

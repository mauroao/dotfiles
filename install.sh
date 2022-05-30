# temporary clean old files:
rm -rf ~/.config/nvim/init.vim
rm -rf ~/.config/nvim/lua

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

function install_packer {
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
        ~/.local/share/nvim/site/pack/packer/start/packer.nvim\
        2>/dev/null
}

function install_autosuggestions {
    git clone https://github.com/zsh-users/zsh-autosuggestions\ 
        ~/.zsh/zsh-autosuggestions\
        2>/dev/null
}

download_git_file "git-prompt.sh"

create_symbolic_link ~/.dotfiles/dotfiles/.zshrc ~/.zshrc
create_symbolic_link ~/.dotfiles/dotfiles/.vimrc ~/.vimrc
create_symbolic_link ~/.dotfiles/dotfiles/.gitconfig ~/.gitconfig

mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/lua

create_symbolic_link ~/.dotfiles/dotfiles/init.lua ~/.config/nvim/init.lua
create_symbolic_link ~/.dotfiles/dotfiles/options.lua ~/.config/nvim/lua/options.lua
create_symbolic_link ~/.dotfiles/dotfiles/plugins.lua ~/.config/nvim/lua/plugins.lua

install_packer

install_autosuggestions 

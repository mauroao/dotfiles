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

function install_nvm {
    if [[ ! -d ~/.nvm ]] ; then
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    fi
}

download_git_file "git-prompt.sh"

create_symbolic_link ~/.dotfiles/dotfiles/.tmux.conf ~/.tmux.conf
create_symbolic_link ~/.dotfiles/dotfiles/.zshrc ~/.zshrc
create_symbolic_link ~/.dotfiles/dotfiles/.vimrc ~/.vimrc
create_symbolic_link ~/.dotfiles/dotfiles/.gitconfig ~/.gitconfig

mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/lua

create_symbolic_link ~/.dotfiles/dotfiles/nvim/init.lua ~/.config/nvim/init.lua
create_symbolic_link ~/.dotfiles/dotfiles/nvim/lua/options.lua ~/.config/nvim/lua/options.lua
create_symbolic_link ~/.dotfiles/dotfiles/nvim/lua/plugins.lua ~/.config/nvim/lua/plugins.lua
create_symbolic_link ~/.dotfiles/dotfiles/nvim/lua/keymappings.lua ~/.config/nvim/lua/keymappings.lua
create_symbolic_link ~/.dotfiles/dotfiles/nvim/lua/setup.lua ~/.config/nvim/lua/setup.lua
create_symbolic_link ~/.dotfiles/dotfiles/nvim/lua/nvim-cmp.lua ~/.config/nvim/lua/nvim-cmp.lua
create_symbolic_link ~/.dotfiles/dotfiles/nvim/lua/nvim-lspconfig.lua ~/.config/nvim/lua/nvim-lspconfig.lua
create_symbolic_link ~/.dotfiles/dotfiles/nvim/lua/lspsaga-nvim.lua ~/.config/nvim/lua/lspsaga-nvim.lua
create_symbolic_link ~/.dotfiles/dotfiles/lvim/config.lua ~/.config/lvim/config.lua
create_symbolic_link ~/.dotfiles/dotfiles/.vimrc ~/.ideavimrc

install_packer

install_autosuggestions


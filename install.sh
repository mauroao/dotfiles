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

function download_vim_plug() {
    sh -c 'curl --silent -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    echo "downloaded vim plug"
}

download_git_file "git-prompt.sh"
download_vim_plug

create_symbolic_link ~/.dotfiles/dotfiles/.zshrc ~/.zshrc
create_symbolic_link ~/.dotfiles/dotfiles/.vimrc ~/.vimrc
create_symbolic_link ~/.dotfiles/dotfiles/.gitconfig ~/.gitconfig

mkdir -p ~/.config/nvim
create_symbolic_link ~/.dotfiles/dotfiles/.vimrc ~/.config/nvim/init.vim


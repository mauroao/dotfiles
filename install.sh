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

if [[ $OSTYPE == "darwin"* ]]; then
    IS_MAC=true
    echo "OS Type = MAC"
else
    IS_MAC=false
    echo "OS Type = Linux"
fi

create_symbolic_link ~/.dotfiles/dotfiles/.vimrc ~/.vimrc
create_symbolic_link ~/.dotfiles/dotfiles/.gitconfig ~/.gitconfig
download_git_file "git-prompt.sh"

if [[ $IS_MAC == "true" ]]; then
    create_symbolic_link ~/.dotfiles/dotfiles/.zshrc ~/.zshrc
else
    download_git_file "git-completion.bash"
    if ! grep -q "source ~/.git-completion.bash" ~/.bashrc; then
        cat ~/.dotfiles/dotfiles/.bashrc >> ~/.bashrc
    fi
fi

mkdir -p ~/.config/nvim
create_symbolic_link ~/.dotfiles/dotfiles/.vimrc ~/.config/nvim/init.vim

download_vim_plug



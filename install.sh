function create_symbolic_link() {
    rm -rf ~/"$1"
    ln -s ~/.dotfiles/"$1" ~/"$1"
}

function download_file() {
    rm -rf ~/."$1"
    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/"$1" --output ~/."$1"
}
         https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
create_symbolic_link ".zshrc"
create_symbolic_link ".vimrc"
create_symbolic_link ".gitconfig"
download_file "git-prompt.sh"
download_file "git-completion.bash"


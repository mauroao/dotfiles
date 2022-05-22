function create_symbolic_link() {
    rm -rf ~/"$1"
    ln -s ~/.dotfiles/"$1" ~/"$1"
}

create_symbolic_link ".zshrc"
create_symbolic_link ".vimrc"
create_symbolic_link ".gitconfig"

GIT_SCRIPT="git-prompt.sh"
rm -rf ~/."$GIT_SCRIPT"
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/"$GIT_SCRIPT" --output ~/."$GIT_SCRIPT"


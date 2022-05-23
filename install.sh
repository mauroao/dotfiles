if [[ $OS_TYPE == "darwin"* ]]; then
    IS_MAC=true
else
    IS_MAC=false
fi

if [[ $IS_MAC = "true" ]]; then
    echo "OS Type = MAC"
else
    echo "OS Type = Linux"
fi

function create_symbolic_link() {
    rm -rf ~/"$1"
    ln -s ~/.dotfiles/"$1" ~/"$1"
    echo "created link $1"
}

function download_file() {
    rm -rf ~/."$1"
    curl --silent  https://raw.githubusercontent.com/git/git/master/contrib/completion/"$1" --output ~/."$1"
    echo "downloaded $1"
}

create_symbolic_link ".vimrc"
create_symbolic_link ".gitconfig"
download_file "git-prompt.sh"

if [[ $IS_MAC = "true" ]]; then
    create_symbolic_link ".zshrc"
else
    download_file "git-completion.bash"
fi

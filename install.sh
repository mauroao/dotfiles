function download_git_file() {
  rm -rf ~/."$1"
  curl --silent https://raw.githubusercontent.com/git/git/master/contrib/completion/"$1" --output ~/."$1"
  echo "downloaded $1"
}

function install_autosuggestions {
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions 2>/dev/null
}

# download_git_file "git-prompt.sh"
# install_autosuggestions

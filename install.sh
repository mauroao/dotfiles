#!/usr/bin/env bash
set -eE

trap 'echo -e "\033[0;31mError on line $LINENO. Exiting.\033[0m" >&2; exit $?' ERR

function download_git_file() {
  local dest=~/".$1"
  if [ -f "$dest" ]; then
    echo "$1 already exists, skipping download."
    return
  fi
  curl --silent https://raw.githubusercontent.com/git/git/master/contrib/completion/"$1" --output "$dest"
  echo "downloaded $1"
}

function install_autosuggestions() {
  if [[ "$(uname)" != "Darwin" ]]; then
    echo "Skipping zsh-autosuggestions: not running on macOS."
    return
  fi
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions 2>/dev/null
  echo "zsh-autosuggestions installed."
}

download_git_file "git-prompt.sh"
install_autosuggestions

echo -e "\033[0;32mAll installations completed successfully.\033[0m"

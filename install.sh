#!/usr/bin/env bash
set -eE

trap 'echo -e "\033[0;31mError on line $LINENO. Exiting.\033[0m" >&2; exit $?' ERR

readonly BASHRC_COMMON_BLOCK=$(cat <<'EOF'
# Shared shell config (git prompt, vi mode, custom prompt)
if [ -f ~/.bashrc_common.sh ]; then
  source ~/.bashrc_common.sh
fi
EOF
)

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

  if [ -d ~/.zsh/zsh-autosuggestions ]; then
    echo "Skipping zsh-autosuggestions: already installed."
    return
  fi

  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions 2>/dev/null
  echo "zsh-autosuggestions installed."
}

function install_tmux_bash_completion() {
  if [[ "$(uname)" == "Darwin" ]]; then
    echo "Skipping tmux-bash-completion: running on macOS."
    return
  fi

  if [ -d ~/.tmux-bash-completion ]; then
    echo "Skipping tmux-bash-completion: already installed."
    return
  fi

  git clone https://github.com/imomaliev/tmux-bash-completion.git ~/.tmux-bash-completion
  echo "tmux-bash-completion installed."
}

function ensure_bashrc_common_block() {
  if [[ "$(uname)" == "Darwin" ]]; then
    echo "Skipping ~/.bashrc common block: running on macOS."
    return
  fi

  local bashrc_file=~/.bashrc
  local bashrc_common_reference='~/.bashrc_common.sh'

  touch "$bashrc_file"

  if grep -Fq "$bashrc_common_reference" "$bashrc_file"; then
    echo "~/.bashrc already contains the shared shell config block."
    return
  fi

  printf '\n%s\n' "$BASHRC_COMMON_BLOCK" >> "$bashrc_file"
  echo "Shared shell config block added to ~/.bashrc."
}

download_git_file "git-prompt.sh"
install_autosuggestions
install_tmux_bash_completion
ensure_bashrc_common_block

echo -e "\033[0;32mAll installations completed successfully.\033[0m"

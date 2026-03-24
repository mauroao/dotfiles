# Everything in this block only runs outside the Warp terminal.
if [[ -z "$WARP_IS_LOCAL_SHELL_SESSION" ]]; then
  # Git prompt support
  if [[ -f "$HOME/.git-prompt.sh" ]]; then
    source "$HOME/.git-prompt.sh"
  fi

  export GIT_PS1_SHOWDIRTYSTATE=1
  export GIT_PS1_SHOWUNTRACKEDFILES=1
  export GIT_PS1_SHOWCOLORHINTS=1
  export GIT_PS1_COLOR_PRE=""
  export GIT_PS1_COLOR_POST=""

  export VIRTUAL_ENV_DISABLE_PROMPT=1

  # First prompt line
  __prompt_command() {
    local dir="${PWD/#$HOME/\~}"
    local git_prompt=""
    local venv=""

    if declare -F __git_ps1 >/dev/null; then
      git_prompt="$(__git_ps1 " ( %s)")"
    fi

    if [[ -n "$VIRTUAL_ENV" ]]; then
      venv=" ($(basename "$VIRTUAL_ENV"))"
    fi
    printf '%s@%s \033[1;34m%s\033[0m%s%s\n' \
      "$USER" "${HOSTNAME%%.*}" "$dir" \
      "$git_prompt" \
      "$venv"
  }
  PROMPT_COMMAND=__prompt_command

  # Second line: just a space (the mode indicator is prepended by readline)
  PS1=' '

  # Lambda changes color depending on vi mode
  bind 'set show-mode-in-prompt on'
  bind "set vi-ins-mode-string \"\1\033[1;38;5;166m\2λ\1\033[0m\2 \""
  bind "set vi-cmd-mode-string \"\1\033[1m\2λ\1\033[0m\2 \""

  # Vi-style prompt
  set -o vi
  bind -m vi-insert '"jj": vi-movement-mode'
  bind -m vi-insert '"jk": vi-movement-mode'

  export VISUAL=nvim
  export EDITOR=nvim

  if [[ -f /etc/bash_completion ]]; then
    source /etc/bash_completion
  fi

  if [[ -f "$HOME/.tmux-bash-completion/completions/tmux" ]]; then
    source "$HOME/.tmux-bash-completion/completions/tmux"
  fi
fi

alias ll="ls -lah --group-directories-first"
alias vim="nvim"
alias g="git"
alias bcat="batcat"

export GIT_EDITOR=nvim

if [[ -d "$HOME/.pyenv" ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init - bash)"
fi

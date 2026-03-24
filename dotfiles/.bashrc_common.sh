# Everything inside this block only runs outside of Warp terminal:
if [[ -z "$WARP_IS_LOCAL_SHELL_SESSION" ]]; then
  # Git prompt support
  source ~/.git-prompt.sh

  export GIT_PS1_SHOWDIRTYSTATE=1
  export GIT_PS1_SHOWUNTRACKEDFILES=1
  export GIT_PS1_SHOWCOLORHINTS=1
  export GIT_PS1_COLOR_PRE=""
  export GIT_PS1_COLOR_POST=""

  export VIRTUAL_ENV_DISABLE_PROMPT=1

  # Primeira linha do prompt
  __prompt_command() {
    local dir="${PWD/#$HOME/\~}"
    local venv=""
    if [[ -n "$VIRTUAL_ENV" ]]; then
      venv=" ($(basename "$VIRTUAL_ENV"))"
    fi
    printf '%s@%s \033[1;34m%s\033[0m%s%s\n' \
      "$USER" "${HOSTNAME%%.*}" "$dir" \
      "$(__git_ps1 " ( %s)")" \
      "$venv"
  }
  PROMPT_COMMAND=__prompt_command

  # Segunda linha: só espaço (o mode indicator é prepended pelo readline)
  PS1=' '

  # Lambda muda de cor conforme o modo vi
  bind 'set show-mode-in-prompt on'
  bind "set vi-ins-mode-string \"\1\033[1;38;5;166m\2λ\1\033[0m\2 \""
  bind "set vi-cmd-mode-string \"\1\033[1m\2λ\1\033[0m\2 \""

  # VIM stile prompt:
  set -o vi
  bind -m vi-insert '"jj": vi-movement-mode'
  bind -m vi-insert '"jk": vi-movement-mode'

  export VISUAL=vim
  export EDITOR=vim
fi

alias ll="ls -lah --group-directories-first "
alias vim="nvim"
alias g="git"
alias bcat="batcat"

export GIT_EDITOR=nvim

if [[ -d "$HOME/.pyenv" ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init - bash)"
fi

if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

if [ -f ~/.tmux-bash-completion/completions/tmux ]; then
  source ~/.tmux-bash-completion/completions/tmux
fi

if [[ -z "$WARP_IS_LOCAL_SHELL_SESSION" ]]; then
  # Git prompt support
  source ~/.git-prompt.sh

  export GIT_PS1_SHOWDIRTYSTATE=1
  export GIT_PS1_SHOWUNTRACKEDFILES=1
  export GIT_PS1_SHOWCOLORHINTS=1

  # Vi mode
  set -o vi
  bind '"jj": vi-movement-mode'
  bind '"jk": vi-movement-mode'

  # Primeira linha do prompt
  __prompt_command() {
      local dir="${PWD/#$HOME/\~}"
      printf '%s@%s \033[1;34m%s\033[0m%s\n' \
          "$USER" "${HOSTNAME%%.*}" "$dir" \
          "$(__git_ps1 " ( %s)")"
  }
  PROMPT_COMMAND=__prompt_command

  # Segunda linha: só espaço (o mode indicator é prepended pelo readline)
  PS1=' '

  # Lambda muda de cor conforme o modo vi
  bind 'set show-mode-in-prompt on'
  bind "set vi-ins-mode-string \"\1\033[1;38;5;166m\2λ\1\033[0m\2 \""
  bind "set vi-cmd-mode-string \"\1\033[1m\2λ\1\033[0m\2 \""
fi

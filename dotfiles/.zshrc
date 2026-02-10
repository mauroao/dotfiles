# Everything inside this block only runs outside of Warp terminal:
if [[ -z "$WARP_IS_LOCAL_SHELL_SESSION" ]]; then
  # Tab-completion:
  # (from https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Zsh)
  autoload -Uz compinit && compinit
  autoload -U colors && colors

  # Prompt:
  # (from https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh)
  # (from https://zsh-prompt-generator.site)
  source ~/.git-prompt.sh
  NEWLINE=$'\n'
  LAMBDA='%B%F{166}λ%f%b'
  setopt PROMPT_SUBST ; PS1='%n@%m %B%F{blue}%d%f%b $(__git_ps1 "( %s)") ${NEWLINE}${LAMBDA}'

  export GIT_PS1_SHOWDIRTYSTATE=1
  export GIT_PS1_SHOWUNTRACKEDFILES=1
  export GIT_PS1_SHOWCOLORHINTS=1

  export SAVEHIST=1000

  # Run autosuggestions:
  source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

  # VIM style prompt:
  set -o vi
  bindkey -M viins 'jj' vi-cmd-mode
  bindkey -M viins 'jk' vi-cmd-mode

  function zle-keymap-select zle-line-init {
    case $KEYMAP in
      vicmd)      LAMBDA='%Bλ%b ' ;;
      viins|main) LAMBDA='%B%F{166}λ%f%b ' ;;
    esac
    zle reset-prompt
  }
  zle -N zle-keymap-select
  zle -N zle-line-init
fi

# Colors:
# (from: https://www.cyberciti.biz/faq/apple-mac-osx-terminal-color-ls-output-option/)
export CLICOLOR=1
export LSCOLORS=ExFxxxxxCxxxxxxxxxExEx

export GIT_EDITOR=nvim

#Alias:
if [[ "$OSTYPE" == "linux"* ]]; then
    alias ls="ls --color=auto"
fi

alias ll="ls -lah "
alias vim="nvim"
alias g="git"

# NVM stuff:
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# .NET Tools Path:
export PATH="$HOME/.dotnet/tools/:$PATH"

# Deno:
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Pyenv stuff:
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

if [[ "$OSTYPE" == "darwin"* ]]; then
    export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home/"
    export DOTNET_ROOT="/usr/local/share/dotnet"
fi

# Android
export ANDROID_HOME="$HOME/Library/Android/sdk/"
export PATH="${HOME}/Library/Android/sdk/cmdline-tools/latest/bin:${HOME}/Library/Android/sdk/platform-tools:${PATH}"

# Nvim on Ubuntu
if [[ "$OSTYPE" == "linux"* ]]; then
    export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
fi

# Go
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# Lvim
export PATH="${HOME}/.local/bin:${PATH}"

# Go to Home if it is not inside TMUX session:
if [[ -z "$TMUX" ]]; then
  cd
fi

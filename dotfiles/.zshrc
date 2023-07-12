# Tab-completion:
# (from https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Zsh)
autoload -Uz compinit && compinit
autoload -U colors && colors

# Colors:
# (from: https://www.cyberciti.biz/faq/apple-mac-osx-terminal-color-ls-output-option/)
export CLICOLOR=1
export LSCOLORS=ExFxxxxxCxxxxxxxxxExEx

# Prompt:
# (from https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh)
# (from https://zsh-prompt-generator.site)
source ~/.git-prompt.sh
NEWLINE=$'\n'
setopt PROMPT_SUBST ; PS1='%n@%m %B%F{blue}%d%f%b $(__git_ps1 "( %s)") ${NEWLINE}%B%F{166}λ%f%b '

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWCOLORHINTS=1

export GIT_EDITOR=nvim

export SAVEHIST=1000

#Alias:
if [[ "$OSTYPE" == "linux"* ]]; then
    alias ls="ls --color=auto"
fi

alias ll="ls -la "
alias vim="nvim"
alias g="git"

# Run autosuggestions:
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# NVM stuff:
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# .NET Tools Path:
export PATH="$HOME/.dotnet/tools/:$PATH"

# Deno:
export DENO_INSTALL="/home/mauro/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Pyenv stuff:
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# VIM stile prompt:
set -o vi
bindkey -M viins 'jj' vi-cmd-mode
bindkey -M viins 'jk' vi-cmd-mode

# Java
export PATH="/opt/homebrew/opt/openjdk/bin/:$PATH"
export JAVA_HOME="/opt/homebrew/opt/openjdk/"

# Android
export ANDROID_HOME="$HOME/Library/Android/sdk/"
export PATH="${HOME}/Library/Android/sdk/tools:${HOME}/Library/Android/sdk/platform-tools:${PATH}"

# Lvim
export PATH="${HOME}/.local/bin:${PATH}"

# Go to Home:
cd


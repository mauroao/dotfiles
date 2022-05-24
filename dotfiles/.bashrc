# Prompt:
# (from https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh)
# (from https://scriptim.github.io/bash-prompt-generator/)

source ~/.git-completion.bash
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWCOLORHINTS=1
PS1='\[\e[0m\]\u\[\e[0m\]@\[\e[0m\]\h \[\e[0;1;94m\]\w \[\e[0;92m\]$(__git_ps1 "(%s)")\n\[\e[0;1;38;5;202m\]λ \[\e[0m\]'


# Tab-completion:
# (from https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Zsh)
autoload -Uz compinit && compinit
autoload -U colors && colors

# Directory and files colors:
# (from https://geoff.greer.fm/lscolors/)
export CLICOLOR=1
export LSCOLORS=ExFxxxxxCxxxxxxxxxExEx

# Prompt:
# (from https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh)
source ~/.git-prompt.sh
NEWLINE=$'\n'
setopt PROMPT_SUBST ; PS1='%n@%m %B%{$fg[blue]%}%c%{$reset_color%}%b$(__git_ps1 " ( %s)") ${NEWLINE}ﬦ '
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWCOLORHINTS=1

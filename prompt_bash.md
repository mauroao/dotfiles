# Replicating the ZSH Prompt in Bash

The ZSH prompt defined in `.zshrc` looks like this:

```
username@hostname /full/path/to/dir ( branch *)
λ
```

Where the directory path is **bold blue**, the `λ` is **bold orange** (256-color 166), and git status is shown in parentheses.

## Prerequisites

The file `~/.git-prompt.sh` must be present (same one used by the ZSH config). It supports both bash and zsh.

## Lines to add to `~/.bashrc`

```bash
# Git prompt support
source ~/.git-prompt.sh

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWCOLORHINTS=1

# Prompt
PS1='\u@\h \[\033[1;34m\]\w\[\033[0m\] $(__git_ps1 "( %s)") \n\[\033[1;38;5;166m\]λ\[\033[0m\] '
```

## ZSH to Bash translation reference

| ZSH | Bash | Purpose |
|-----|------|---------|
| `%n` | `\u` | Username |
| `%m` | `\h` | Hostname |
| `%d` | `\w` | Full working directory |
| `%B` | `\[\033[1m\]` | Bold on |
| `%b` | `\[\033[0m\]` | Bold off (reset) |
| `%F{blue}` | `\[\033[34m\]` | Blue foreground |
| `%F{166}` | `\[\033[38;5;166m\]` | 256-color orange foreground |
| `%f` | `\[\033[0m\]` | Reset foreground |
| `setopt PROMPT_SUBST` | *(not needed)* | Bash expands `$()` in PS1 by default |

## PS1 breakdown

```
\u@\h                        # username@hostname
 \[\033[1;34m\]              # bold + blue
\w                           # full working directory
\[\033[0m\]                  # reset
 $(__git_ps1 "( %s)")       # git branch/status in parentheses
 \n                          # newline
\[\033[1;38;5;166m\]         # bold + 256-color orange
λ                            # lambda symbol
\[\033[0m\]                  # reset
                             # trailing space
```

**Note:** `\[...\]` wraps non-printing sequences so bash calculates line length correctly. Without them, line editing and wrapping will break.

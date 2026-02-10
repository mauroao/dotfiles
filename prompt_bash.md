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

## Vi mode com lambda dinâmico

In the ZSH config, the lambda (`λ`) changes color based on vi mode via `zle-keymap-select`. Bash doesn't have `zle`, but readline (bash 4.4+ / readline 7.0+) provides `show-mode-in-prompt`, which prepends a mode indicator string to `PS1`.

**Requires bash 4.4+.**

### Why the prompt is split

The readline mode indicator is always prepended to the **beginning** of `PS1`. Since the λ lives on the second line of the prompt, we can't use a single `PS1` for both lines. The solution:

- **`PROMPT_COMMAND`** prints the first line (user@host, path, git info)
- **`PS1`** contains only a space (the second line)
- **readline** prepends the colored λ to `PS1`, producing `λ ` as the second line

When the user switches vi modes, readline swaps the λ string automatically.

### Lines to add to `~/.bashrc`

```bash
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
```

### ZSH → Bash vi mode translation

| ZSH | Bash (readline) | Purpose |
|-----|-----------------|---------|
| `bindkey -v` | `set -o vi` | Enable vi mode |
| `bindkey -M viins 'jj' vi-cmd-mode` | `bind '"jj": vi-movement-mode'` | Map `jj` to command mode |
| `zle-keymap-select` + `zle reset-prompt` | `show-mode-in-prompt` | Change prompt on mode switch |
| `%B%F{166}λ%f%b` (insert) | `vi-ins-mode-string` | Insert mode indicator |
| `%Bλ%b` (command) | `vi-cmd-mode-string` | Command mode indicator |
| `\[` / `\]` in PS1 | `\1` / `\2` in readline strings | Non-printing sequence delimiters |

### Readline escapes

In readline mode strings, `\1` and `\2` serve the same role as `\[` and `\]` in PS1: they delimit non-printing escape sequences so the terminal calculates cursor position correctly.

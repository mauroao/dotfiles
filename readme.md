# Mauro's DotFiles

The goal of this project is to provide all required "dot files" to setup a fresh new computer environment, **running on ZSH** shell.

## Install prerequisites

- [Ubuntu 22.04.02 LTS on WSL](prerequisites-win.md)
- [Mac](prerequisites-mac.md)

## Clone it:

```
git clone git@github.com:mauroao/dotfiles.git ~/.dotfiles
```

## Install it:

```
. ~/.dotfiles/setup_lazy_vim.sh
. ~/.create_links.sh
```

## Install more stuff

- Node.js
  ```
  nvm install --lts
  nvm alias default node
  ```

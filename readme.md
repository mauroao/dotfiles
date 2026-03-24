# Mauro's DotFiles

The goal of this project is to setup all dotfiles for MacOS and Ubuntu (bare metal or WSL).

## Install prerequisites

- [Ubuntu LTS on WSL](prerequisites-win.md)
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

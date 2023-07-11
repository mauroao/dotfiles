# Mauro's DotFiles

The goal of this project is to provide all required "dot files" to setup a fresh new computer environment, **running on ZSH** shell.

## Install prerequisites

- [Ubuntu 20.04 on WSL](prerequisites-win.md)
- [Mac](prerequisites-mac.md)

## Clone it:

```
git clone git@github.com:mauroao/dotfiles.git ~/.dotfiles
```

## Install it:

```
. ~/.dotfiles/install.sh
```

## Install NeoVim Plugins

- Open nvim and run:
  ```
  :PackerSync
  ```
This script works fine with:
- MAC OS Catalina;
- MAC OS Monterey;
- Ubuntu 20.04 running on WSL;

## Install more stuff

- Node.js
  ```
  nvm install 16.16.0 && nvm use 16.16.0
  ```

- Python Language Server
  ```
  npm install -g pyright
  ```

- Typescript Language Server
  ```
  npm install -g typescript typescript-language-server
  ```

- C# Language Server
  ```
  dotnet tool install --global csharp-ls
  ```

- HTML Language Server
  ```
  npm install -g vscode-langservers-extracted
  ```

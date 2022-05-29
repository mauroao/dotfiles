# Mauro's DotFiles

The goal of this project is to provide all required "dot files" to setup a fresh new computer environment, **running on ZSH** shell.  
These scripts works fine with:
- MAC OS Catalina;
- MAC OS Monterey;
- Ubuntu 20.04 running on WSL;

## Prerequisites:

- Install NERD FONTS from [here](fonts/)
- https://iterm2.com (for MAC)
- git
- curl
- vim
- neovim

## Clone it:

Using ssh:
```
 git clone git@github.com:mauroao/dotfiles.git ~/.dotfiles
```
Or using http:
```
git clone https://github.com/mauroao/dotfiles.git ~/.dotfiles
```

## Install it:

```
. ~/.dotfiles/install.sh
```
## Install NeoVim Plugins

- Open nvim and run:
```
:PlugInstall
```


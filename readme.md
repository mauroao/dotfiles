# Mauro's DotFiles

The goal of this project is to provide all required "dot files" to setup a fresh new computer environment, **running on ZSH** shell.  

## Prerequisites for MAC: 

- Install NERD FONTS from [here](fonts/);
- Install [Homebrew](https://brew.sh)
- Run above commands:
```
brew update
brew install --cask iterm2
brew install git
brew install curl 
brew install neovim
```
- Configure iTerm2 to use NERD FONTS;

## Prerequisites for Ubuntu 20.04 on WSL:

- Install NERD FONTS from [here](fonts/);
- Install [WSL](https://docs.microsoft.com/en-us/windows/wsl/install);
- Install [Ubuntu](https://apps.microsoft.com/store/detail/ubuntu-2004/9N6SVWS3RX71?hl=pt-br&gl=BR);
- Download nvim-linux64.deb from https://github.com/neovim/neovim/releases/tag/v0.7.0 (check for version 0.7.0 or newer);
- Open Ubuntu and run above commands:
```
sudo apt update
sudo apt install zsh -y
sudo apt install git -y
sudo apt install curl -y
sudo apt install ./nvim-linux64.deb -y
sudo chsh -s $(which zsh)
```
- Install [Hyper](https://hyper.is) and configure it to use NERD FONTS;
- Configure Hyper like above:
```
shell: 'wsl.exe',
shellArgs: ['-d', 'Ubuntu-20.04', '--cd', '~'],
```

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
:PackerSync
```
This script works fine with:
- MAC OS Catalina;
- MAC OS Monterey;
- Ubuntu 20.04 running on WSL;

# Mauro's DotFiles

The goal of this project is to provide all required "dot files" to setup a fresh new computer environment, **running on ZSH** shell.  

## Prerequisites for MAC: 

- Install NERD FONTS from [here](fonts/);
- Install [Homebrew](https://brew.sh)
- Run the commands below:
  ```
  brew update
  brew install --cask iterm2
  brew install git
  brew install curl 
  brew install neovim
  brew install ripgrep
  brew install pyenv
  ```
  
- Configure iTerm2 to use NERD FONTS;

## Prerequisites for Ubuntu 20.04 on WSL:

- Install NERD FONTS from [here](fonts/);
- Install [WSL](https://docs.microsoft.com/en-us/windows/wsl/install);
- Install [Ubuntu](https://apps.microsoft.com/store/detail/ubuntu-2004/9N6SVWS3RX71?hl=pt-br&gl=BR);
- Install [Docker Desktop](https://www.docker.com/products/docker-desktop/);
- Open Ubuntu and run the commands below:
  ```
  sudo apt update && \
  sudo apt install zsh -y && \
  sudo apt install git -y && \
  sudo apt install curl -y && \
  sudo apt install ripgrep -y && \
  curl -sL https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.deb -o nvim-linux64.deb && \
  sudo apt install ./nvim-linux64.deb -y && \
  sudo apt install gcc -y && \
  sudo apt install g++ -y && \
  sudo chsh -s $(which zsh)
  ```
  
- Run more commands below (prerequisites for pyenv):
  ```
  sudo apt update; sudo apt install -y make build-essential libssl-dev zlib1g-dev \
  libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
  libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
  ```
  
- Install Pyenv
  ```
  curl https://pyenv.run | bash
  ```
  
- Copy SSH Keys from windows host:
  ```
  rm -rf ~/.ssh/ && \
  mkdir ~/.ssh/ && \
  cp /mnt/c/Users/maurooliveira/.ssh/id* ~/.ssh/ && \
  chmod 600 ~/.ssh/id_rsa
  ```
  
- Install Windows Terminal from Microsoft Store;
- Configure Ubuntu 20.04.4 LTS on Windows Terminal:
  - Command line: `C:\WINDOWS\system32\wsl.exe -d Ubuntu-20.04 zsh`
  - Appearance:
    - Font face: SauceCodePro Nerd Font;
    - Font size: 13;
    - Color Scheme: Tango Dark;
    - Font weight: Medium

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

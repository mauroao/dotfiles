# Prerequisites for Ubuntu 22.04.02 LTS on WSL:

- Install NERD FONTS from [here](fonts/);
  > Install ALL font files!!!!
- Install [WSL](https://docs.microsoft.com/en-us/windows/wsl/install);
- Install Ubuntu 22.04.02 LTS from Microsot Store;
- Install [Docker Desktop](https://www.docker.com/products/docker-desktop/);

- Open Ubuntu and run the commands below:
  ```
  sudo apt update && sudo apt upgrade -y
  ```

- Open Ubuntu and run the commands below:
  ```
  sudo apt install zsh -y && \
  sudo apt install git -y && \
  sudo apt install curl -y && \
  sudo apt install ripgrep -y && \
  sudo apt install unzip -y && \
  sudo apt install gcc -y && \
  sudo apt install g++ -y && \
  sudo apt install python3.10-venv && \
  sudo apt install python3-pip -y
  sudo apt install fzf -y

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

- Install Netcore 8.0
  ```
  wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
  sudo dpkg -i packages-microsoft-prod.deb
  rm packages-microsoft-prod.deb
  ```

  ```
  sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-8.0
  ```

- Install Go
  ```
  sudo apt update && sudo apt -y install golang-go
  ```

- Copy SSH Keys from windows host (check windows home user):
  ```
  rm -rf ~/.ssh/ && \
  mkdir ~/.ssh/ && \
  cp /mnt/c/Users/mauro/.ssh/id* ~/.ssh/ && \
  cp /mnt/c/Users/mauro/.ssh/config ~/.ssh/config && \
  chmod 600 ~/.ssh/id*
  ```

- Install Windows Terminal from Microsoft Store;
- Configure Ubuntu 22.04.2 LTS on Windows Terminal:
  - Command line:
    ```
    C:\WINDOWS\system32\wsl.exe -d Ubuntu-22.04 zsh
    ```
  - Appearance:
    - Font face: SauceCodePro Nerd Font;
    - Font size: 13;
    - Color Scheme: Tango Dark;
    - Font weight: Medium
- Install NVM from [here](https://github.com/nvm-sh/nvm#install--update-script)
- Install Neovim 0.9.1+ from [here](https://github.com/neovim/neovim/releases)


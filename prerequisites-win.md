# Prerequisites for Ubuntu 20.04 on WSL:

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
  sudo apt install unzip -y && \
  curl -sL https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.deb -o nvim-linux64.deb && \
  sudo apt install ./nvim-linux64.deb -y && \
  sudo apt install gcc -y && \
  sudo apt install g++ -y && \
  sudo apt install python3.8-venv -y && \
  sudo apt install python3-pip -y
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

- Install Netcore 3.1 and Dotnet 6.0
  ```
  wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
  sudo dpkg -i packages-microsoft-prod.deb
  rm packages-microsoft-prod.deb
  ```

  ```
  sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-3.1
  ```

  ```
  sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-6.0
  ```

- Copy SSH Keys from windows host (check windows home user):
  ```
  rm -rf ~/.ssh/ && \
  mkdir ~/.ssh/ && \
  cp /mnt/c/Users/maurooliveira/.ssh/id* ~/.ssh/ && \
  chmod 600 ~/.ssh/id*
  ```

- Install Windows Terminal from Microsoft Store;
- Configure Ubuntu 20.04.4 LTS on Windows Terminal:
  - Command line:
    ```
    C:\WINDOWS\system32\wsl.exe -d Ubuntu-20.04 zsh
    ```
  - Appearance:
    - Font face: SauceCodePro Nerd Font;
    - Font size: 13;
    - Color Scheme: Tango Dark;
    - Font weight: Medium



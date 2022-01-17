# WSL

Template project for creating private repository to manage wsl development environment.

## Windows Configuration

- [VSCODE](https://code.visualstudio.com/)
- [Chocolatey](https://chocolatey.org/)
  - Chocolatey GUI (optional)
    > choco install chocolateygui
  - Git
    > choco install git
- [WSL](https://docs.microsoft.com/en-us/windows/wsl/)
  - Default install [instructions](https://docs.microsoft.com/en-us/windows/wsl/install)
  - App store [preview](https://www.microsoft.com/store/productId/9P9TQF7MRM4R)
  - [Best Practices](https://docs.microsoft.com/en-us/windows/wsl/setup/environment#set-up-your-linux-username-and-password)

## Clone this repository (powershell)

```powershell
cd ~
git clone https://github.com/IamSuperCB/wsl.git
```

## Ubuntu (Personal)

### install

```powershell
wsl --install -d Ubuntu
```

### Base Configuration (wsl -d Ubuntu)

Update

```bash
sudo apt update
sudo apt upgrade
```

Docker group

```bash
sudo groupadd -g 999 docker
sudo usermod -aG docker $USER
```

Docker client

```bash
sudo apt update
sudo apt install docker.io
```

NVM install [instructions](https://github.com/nvm-sh/nvm#install--update-script)

```bash
nvm install lts/fermium
nvm alias default lts/fermium
```

### Backup (powershell)

```powershell
cd ~/wsl
mkdir backups
wsl --export Ubuntu backups/UbuntuBase.tar
```

### finish configuration (wsl -d Ubuntu)

Clone this project into Ubuntu

```bash
cd ~
mkdir github
mkdir github/iamsupercb
cd github/iamsupercb
git clone https://github.com/IamSuperCB/fos.git
```

Install docker using [ubuntu docker-engine instructions](https://docs.docker.com/engine/install/ubuntu/).

Configure daemon

```bash
cd ~
sudo mkdir /etc/docker
sudo cp dockerdaemon.json /etc/docker/daemon.json
mkdir bin
cp docker-service

```

Start docker service

- Within distro
  ```bash
  cd ~
  bin/docker-service
  ```
- From powershell
  ```powershell
  wsl -d UbuntuPersonal /home/betancourtca/bin/docker-service
  ```

## UbuntuUPMCE (work)

### Create (powershell)

```powershell
cd ~/wsl
mkdir distros/UbuntuUPMCE
wsl --import UbuntuUPMCE distros/UbuntuUPMCE backups/UbuntuBase.tar
```

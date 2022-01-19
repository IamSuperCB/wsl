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
  - [Best Practices](https://docs.microsoft.com/en-us/windows/wsl/setup/environment#set-up-your-linux-username-and-password)
  - Choose a method
    - Default install [instructions](https://docs.microsoft.com/en-us/windows/wsl/install)
    - App store [preview](https://www.microsoft.com/store/productId/9P9TQF7MRM4R)
  - create wsl folder in home directory
    ```powershell
    cd ~
    mkdir wsl/distros
    mkdir wsl/backups
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
wsl --export Ubuntu backups/ubunt.base.tar
```

### finish configuration (wsl -d Ubuntu)

Clone this project into Ubuntu

```bash
cd ~
git clone https://github.com/IamSuperCB/wsl.git workspace
mkdir workspace/data
ln -s workspace/data data
ln -s workspace/bin bin
ln -s workspace/.gitconfig .gitconfig
ln -s workspace/.npmrc .npmrc
ln -s workspace/nodemon.json nodemon.json
```

Add the following string to ~/.profile

```bash
# Exposes workspace to other distros
if [ ! -d /mnt/wsl/fos ]; then
    wsl.exe -d $WSL_DISTRO_NAME -u root /home/$USER/bin/configure-for-secondary-wsl.sh
fi
```

Install docker using [ubuntu docker-engine instructions](https://docs.docker.com/engine/install/ubuntu/).

Configure daemon

```bash
cd ~/wsl
sudo mkdir /etc/docker
sudo cp dockerdaemon.json /etc/docker/daemon.json
```

Start [docker-service](bin/docker-service) script

- Within distro
  ```bash
  cd ~
  bin/docker-service.sh
  ```
- From powershell
  ```powershell
  wsl -d Ubuntu /home/betancourtca/bin/docker-service.sh
  ```

## UbuntuUPMCE (work)

### Create (powershell)

```powershell
cd ~/wsl
mkdir distros/UbuntuUPMCE
wsl --import UbuntuUPMCE distros/UbuntuUPMCE backups/UbuntuBase.tar
```

### Configure

```bash
cd ~
ln -s /mnt/wsl/workspace workspace
ln -s workspace/data data
ln -s workspace/bin bin
ln -s workspace/.gitconfig .gitconfig
ln -s workspace/.npmrc .npmrc
ln -s workspace/nodemon.json nodemon.json
```

## Notes

- [sample.code-workspace](sample.code-workspace) is a sample vscode workspace containing information needed for accessing `Ubuntu` distro docker.
- [.vscode](.vscode) folder
  - [extensions.json](.vscode/extensions.json) contains a list of recommended vscode extensions

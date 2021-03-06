# WSL

Were I go to figure oust things away from people...

## Windows Configuration

- [VSCODE](https://code.visualstudio.com/)
- [Chocolatey](https://chocolatey.org/)
  - Chocolatey GUI (optional)
    > choco install chocolateygui
  - Git
    > choco install git
  - nvm
    > choco install nvm
- WSL
  - Default [instructions](https://docs.microsoft.com/en-us/windows/wsl/instal)
  - App store [preview](https://aka.ms/wslstorepage)

## Create personal folder wsl directory(powershell)

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

Install [Docker](docker/README.md)

NVM install [instructions](https://github.com/nvm-sh/nvm#install--update-script)

```bash
nvm install lts/fermium
nvm alias default lts/fermium
```

Create a backup

```bash
cd ~/wsl
wsl --export Ubuntu backups/ubuntu.base.tar
```

### finish configuration (wsl -d Ubuntu)

Clone this project into Ubuntu

```bash
cd ~
git clone https://github.com/IamSuperCB/wsl.git
mkdir wsl/data
ln -s wsl/data data
ln -s wsl/.gitconfig .gitconfig
ln -s wsl/.npmrc .npmrc
ln -s wsl/nodemon.json nodemon.json
mkdir .aws
```

Link aws file if you do not have done so before

```bash
cd .aws
ln -s ../wsl/awsconfig config
```

Setup .ssh directory

```bash
cd ~
mkdir .ssh
chmod u=rwx,go= .ssh
cd .ssh
cp /mnt/c/Users/{windows-username}/OneDrive/Security/.ssh/id_rsa* ./
chmod u=rw,go= ~/.ssh/id_rsa*
chmod a=r,u+w *.pub
ln -s ../wsl/sshconfig config
```

## Secondary distros

### UbuntuUPMCE

In powershell create new distro using `Ubuntu` backup

```powershell
cd ~/wsl/distros
mkdir UbuntuUPMCE
cd UbuntuUPMCE
wsl --import UbuntuUPMCE .\ ..\..\backups\ubuntu.base.tar
```

Make user default user

```bash
tee /etc/wsl.conf <<_EOF
[user]
default={username}
_EOF
```

Restart wsl in powershell

```powershell
 wsl --shutdown
```

Soft Link Home files/directories

```bash
ln -s wsl/data data
ln -s wsl/.gitconfig .gitconfig
ln -s wsl/.npmrc .npmrc
ln -s wsl/nodemon.json nodemon.json
```

Setup .ssh directory

```bash
cd ~
mkdir .ssh
chmod u=rwx,go= .ssh
cd .ssh
cp /mnt/c/Users/{windows-username}/OneDrive/Security/.ssh/id_rsa* ./
chmod u=rw,go= ~/.ssh/id_rsa*
chmod a=r,u+w *.pub
ln -s ../wsl/sshconfig config
```

Clone UPMCE projects in distro

```bash
cd ~
mkdir upmce
cd upmce
mkdir parlaiq
cd parlaiq
git clone https://localhost:8443/eRound/censusservice
git clone https://localhost:8443/eRound/parlaiq-core
git clone https://localhost:8443/eRound/parlaiq-wso2-is
```

### Amazon2

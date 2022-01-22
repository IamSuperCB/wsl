# Docker

## Primary distro

Choose one of the following options and configure docker.

### Docker desktop

Install instructions [here](https://docs.docker.com/desktop/windows/install/)

### Docker engine

Install [ubuntu](https://docs.docker.com/engine/install/ubuntu/) docker-engine

Configure daemon

```bash
cd ~/wsl/docker
sudo mkdir /etc/docker
sudo cp daemon.json /etc/docker/daemon.json
```

Start docker service

- [docker-service](bin/docker-service.sh)
- Within distro
  ```bash
  ~/wsl/docker/docker-service.sh
  ```
- From Powershell
  ```bash
  wsl -d Ubuntu /home/{username}/wsl/docker/docker-service.sh
  ```

## Secondary distros

### Docker desktop

Go to docker desktop `settings->Resources->WSL Integration` and enable integration for the distro.

### Docker engine

See [docker-engine](../docker-engine.code-workspace) code-workspace sample.

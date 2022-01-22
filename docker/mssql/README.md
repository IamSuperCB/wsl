# Docker MSSQL

## Environment file

Use the following template to create environment file

```environment
ACCEPT_EULA=Y
SA_PASSWORD=yourStrong(!)Password
MSSQL_PID=Developer
```

## Staring MySQL

```bash
docker-compose up -d
```

## Reset

docker-compose configured with a volume. To reset

```mysql
docker-compose down --rmi all
```

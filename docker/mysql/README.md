# Docker MySQL

## Environment file

Use the following template to create environment file

```environment
MYSQL_DATABASE={databasename}
MYSQL_ROOT_PASSWORD=password
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

## local development

If you get errors connecting to database

For mysql 8.x run the following cmd as a query (Replace `root` and `password` as required based on the values in your `.env` file).

```bash
alter user root@'%' identified with mysql_native_password by "password";
```

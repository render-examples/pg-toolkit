# pg-toolkit

`pg-toolkit` is a basic service with postgresql client tools installed. It is
meant to be deployed to render in order to help perform Postgres database
operations using your Render Postgres private internal connection strings.

It is helpful to create a [persistent disk](https://render.com/docs/disks)
within the service to store manual backups temporarily.

## Versioning

The version of all the postgres tools is managed by the Postgres version in
the Dockerfile (e.g. `FROM postres:14`). You should change the version to
whichever major version you are using. For migrations using `pg_dump`, you
should use the version you are upgrading to.

## Common Operations

### Create a database backup

```sh
PGPASSWORD=$DB_PASSWORD pg_dump \
    --host=$DB_HOST \
    --username=$DB_USERNAME \
    --dbname=$DB_NAME \
    --format=custom \
    --file=/var/pgbackups/output.dmp
```

### Restore a database from a backup

```sh
PGPASSWORD=$DB_PASSWORD pg_restore  \
    --host=$DB_HOST \
    --username=$DB_USERNAME \
    --dbname=$DB_NAME \
    /var/pgbackups/output.dmp
```

# medicosmundo Odoo 

This is a generated project from cookicutter odoo

## Quick start

```shell
make build
make start
```

### Other commands

```shell

make module NAME=[YOUR_MODULE] ## Scaffolds new odoo module

make restart ## Restarts docker-compose
make destroy ## Destroy docker-compose containers
make hard_clean ## Destroy docker-compose stack
```

### Debuggin in VS Code
```shell
docker-compose up -d db ## db is the Database service located in the docker-compose.yml

docker-compose run --service-ports web
```
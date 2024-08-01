.PHONY:  help module start restart destroy hard_clean

ODOO_SHA=1e35b89

help:  ## Show help
	# From https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


module: ## Scaffolds new odoo module
	docker-compose run --rm web odoo scaffold $(NAME) /mnt/extra-addons/

start: ## Starts docker
	docker-compose up -d

restart: ## Restarts project
	docker-compose restart

destroy: ## Soft clean project
	docker-compose down

hard_clean: ## Hard clean project
	docker-compose down --rmi all --volumes

fix_permissions: ## Fix linux file owner
	sudo chown -r $USER:$USER .

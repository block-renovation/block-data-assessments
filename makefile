help: ## See below for more information:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

docker-up-build: ## Run a local Postgres container with provided data. Requires that Docker is installed locally
	docker-compose up -d --build

docker-down: ## Stop running the local Postgres container and remove volumes
	docker-compose down --volumes

db-shell: docker-up ## Shell into running Postgres container to execute SQL
	docker-compose run --rm block psql -h block -p 5432 -U postgres

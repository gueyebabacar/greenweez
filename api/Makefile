DC=docker-compose
RUN=$(DC) run --rm api
EXEC=$(DC) exec api
EXEC-TTY=$(DC) exec -T api
CONSOLE=bin/console $(CONSOLE_OPTIONS)

AWK := $(shell command -v awk 2> /dev/null)

.DEFAULT_GOAL := help
.PHONY: help

help:
ifndef AWK
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
else
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'
endif

##
## Project setup
##---------------------------------------------------------------------------

.PHONY: install start stop reset clear cc

install:        ## Start and initialize the project
install: start copy-migrations db-reset cc

start:          ## Start or restart the project
start: docker-files build up api

stop:           ## Stop the project
stop: docker-files
	$(DC) stop

reset:          ## Reset the project
reset: clear install

clear:          ## Remove everything: the cache, the logs, the sessions
clear: clear-files down

cc:             ## Clear and warm up the cache in dev env
cc:
	$(RUN) $(CONSOLE) cache:clear --no-warmup
	$(RUN) $(CONSOLE) cache:warmup

##
## Database
##---------------------------------------------------------------------------

.PHONY: db-reset db-install db-migrate db-fixtures es-populate es-reset

db-install:     ## Reset the database and load fixtures
db-install: docker-files vendor app/config/parameters.yml
	$(EXEC-TTY) php -r "for(;;){if(@fsockopen('database',3306)){break;}};"
	$(RUN) $(CONSOLE) doctrine:database:drop -n --if-exists --force
	$(RUN) $(CONSOLE) doctrine:database:create -n
	$(RUN) $(CONSOLE) doctrine:database:import vendor/wynd/api/data/test/dump/db_test.sql

db-migrate:     ## Migrate database schema to the latest available version
db-migrate: docker-files vendor app/config/parameters.yml
	$(RUN) $(CONSOLE) doctrine:migrations:migrate -n

db-fixtures:    ## Reset the database fixtures
db-fixtures: docker-files vendor app/config/parameters.yml
	$(EXEC-TTY) $(CONSOLE) hautelook_alice:doctrine:fixtures:load -n -b WyndApiCoreBundle --append --no-debug

db-reset:       ## Reset the database (and Elasticsearch)
db-reset: db-install es-reset db-migrate db-fixtures es-populate

es-populate:    ## Repopulate whole index for Elasticsearch
es-populate: docker-files vendor app/config/parameters.yml
	$(RUN) $(CONSOLE) fos:elastica:populate

es-reset:       ## Reset Elasticsearch (removes indexes)
es-reset: docker-files vendor app/config/parameters.yml
	$(RUN) $(CONSOLE) fos:elastica:reset

##
## Tools
##---------------------------------------------------------------------------

.PHONY: swagger.json copy-migrations-force copy-migrations gen-keys fix-cs

swagger.json:   ## Generate Swagger json file with correct configuration for this project
swagger.json: docker-files vendor app/config/parameters.yml
	@$(RUN) composer run-script swagger-generate-cmd

copy-migrations-force:## Reset migrations and copy them from Wynd vendor to the project
copy-migrations-force: docker-files vendor app/config/parameters.yml
	@$(RUN) rm -f var/DoctrineMigrations/*
	@$(RUN) composer run-script copy-migrations

copy-migrations:## Copy migrations from Wynd vendor to the project
copy-migrations: docker-files vendor app/config/parameters.yml
	@$(RUN) composer run-script copy-migrations

gen-keys:       ## Generate public and private keys for JWT authentication
gen-keys: docker-files vendor
	@$(RUN) rm -f var/jwt/public.pem
	$(MAKE) var/jwt/public.pem

fix-cs:         ## Runs the CS fixer to fix the project coding style
fix-cs: docker-files vendor
	$(RUN) vendor/bin/php-cs-fixer fix app -vvv --config=.php_cs --cache-file=.php_cs.cache

##
## Tests
##---------------------------------------------------------------------------

.PHONY: test test-cs test-unit test-functional check-security

test:          ## Runs all tests
test: test-cs test-unit test-functional

test-cs:       ## Test the coding style according to the rules of wynd/api
test-cs: docker-files vendor
	$(RUN) vendor/bin/php-cs-fixer fix app --no-interaction --dry-run --diff -vvv --config=.php_cs --cache-file=.php_cs.cache --using-cache=no

test-unit:     ## Runs the unit tests of the project
test-unit: docker-files vendor app/config/parameters.yml
	$(RUN) vendor/bin/phpunit

test-functional: ## Runs the fonctional tests of the project
test-functional: make-configure-env-test docker-files test-init
	$(RUN) vendor/bin/behat --format='progress' -s project

check-security:  ## Run SensioLabs Security checker
check-security: docker-files vendor
	$(RUN) vendor/bin/security-checker security:check

# Internal rules for tests
#---------------------------------------------------------------------------

.PHONY: test-init
test-init: clear-files start vendor copy-migrations-force db-reset cc

# Internal rules
#---------------------------------------------------------------------------

.PHONY: perm clear-files make-configure-env-test make-configure-env-prod make-configure-no-docker

perm: docker-files
	-$(EXEC) chmod -R u+rwX,go+rX,go-w var

clear-files: docker-files perm
	-$(EXEC-TTY) rm -rf var/cache/*
	-$(EXEC-TTY) rm -rf var/sessions/*
	-$(EXEC-TTY) rm -rf var/logs/*

##
## Makefile configuration
##---------------------------------------------------------------------------

make-configure-env-dev:   ## make in dev environment. Example: make make-configure-env-dev cc
make-configure-env-dev:
	$(eval CONSOLE_OPTIONS := --env=dev)

make-configure-env-test:  ## make in test environment. Example: make make-configure-env-test cc
make-configure-env-test:
	$(eval CONSOLE_OPTIONS := --env=test)

make-configure-env-prod:  ## make in prod environment. Example: make make-configure-env-prod cc
make-configure-env-prod:
	$(eval CONSOLE_OPTIONS := --env=prod)

make-configure-no-docker: ## make without docker. Example: make make-configure-no-docker cc
make-configure-no-docker:
	$(eval DC := )
	$(eval RUN := )
	$(eval EXEC := )
	$(eval EXEC-TTY := )

# Rules from files
#---------------------------------------------------------------------------

.PHONY: api
.PRECIOUS: composer.lock app/config/parameters.yml var/jwt/public.pem

api: vendor app/config/parameters.yml var/jwt/public.pem

vendor/autoload.php: composer.lock
	$(RUN) composer install

vendor: vendor/autoload.php

composer.lock: composer.json
	@echo composer.lock is not up to date.

app/config/parameters.yml: vendor/autoload.php app/config/parameters.yml.dist
	$(RUN) composer run-script post-install-cmd

var/jwt/public.pem: vendor app/config/parameters.yml
	@$(RUN) mkdir -p var/jwt # Ensure folder exists
	@$(RUN) php -r "require'vendor/autoload.php';file_put_contents('passphrase.txt',\Symfony\Component\Yaml\Yaml::parse(file_get_contents('app/config/parameters.yml'))['parameters']['pass_phrase']);"
	@$(RUN) openssl genrsa -out var/jwt/private.pem -aes256 -passout file:passphrase.txt 4096
	@$(RUN) openssl rsa -pubout -in var/jwt/private.pem -passin file:passphrase.txt -out var/jwt/public.pem
	@$(RUN) rm -f passphrase.txt # Delete passphrase file after generation of key pair

# --- Docker ---
.PHONY: docker-files
.PRECIOUS: .env docker-compose.override.yml build up down

docker-files: .env docker-compose.override.yml

.env: .env.dist
	@if [ -f .env ]; \
	then\
		echo '\033[1;41m/!\ The .env.dist file has changed. Please check your .env file (this message will not be displayed again).\033[0m';\
		touch .env;\
		exit 1;\
	else\
		echo cp .env.dist .env;\
		cp .env.dist .env;\
	fi

docker-compose.override.yml: docker-compose.yml
	@if [ -f docker-compose.override.yml ]; \
	then\
		echo '\033[1;41m/!\ The docker-compose.yml file has changed. Please check your docker-compose.override.yml file (this message will not be displayed again).\033[0m';\
		touch docker-compose.override.yml;\
		exit 1;\
	fi

build: docker-files
	$(DC) build

up: docker-files
	$(DC) up -d --no-recreate

down: docker-files
	$(DC) down -v

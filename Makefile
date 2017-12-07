.DEFAULT_GOAL := help
.SILENT :

GREEN = \033[0;32m
NC = \033[0m

LDAP_USER ?= read -p "LDAP username: " ldap_username;
LDAP_PASSWORD ?= stty -echo; read -p "LDAP Password: " ldap_password; stty echo;

## Display this help dialog
help:
	echo "This Makefile help you using yout local development environment."
	echo "Usage: make <action>"
	awk '/^[a-zA-Z\-\_0-9]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf "\t${GREEN}%-20s${NC} %s\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)
.PHONY: help

DC=docker-compose
CONSOLE=bin/console
DOCKER=docker run --rm -ti
PHP=$(DOCKER) -v ${PWD}:/workspace -v ~/.ssh/id_rsa:/home/docker/.ssh/id_rsa -v ~/.ssh/id_rsa.pub:/home/docker/.ssh/id_rsa.pub -w /workspace --env-file .composer.env
PHP70=$(PHP) docker/php70
NPM_MKP=$(DOCKER) -v "${PWD}/marketplace":/data -w /data node:5
RUN_API=$(DC) run --rm api
RUN_FRONT=$(DC) run --rm front

## Initialize the project
init-project: init-dist-file init-git init-api init-bo init-ods init-mkp init-database init-elasticsearch install-front
.PHONY: init-project

## Initialise the project dist files
init-dist-file:
	echo "Initialize project dist files..."
	$(call composer_env)
ifeq ($(shell docker images -q docker/php70),)
	$(call build_php70)
endif
	$(PHP70) php project-manager/console.php init-dist
.PHONY: init-dist-file

## Initialize the git repository
init-git:
	echo "Initialize git repository..."
	$(call composer_env)
ifeq ($(shell docker images -q docker/php70),)
	$(call build_php70)
endif
	$(PHP70) php project-manager/console.php init-git
.PHONY: init-git

## Initialize the API
init-api:
	echo "Building api..."
	rm -rf api
	$(call composer_env)
ifeq ($(shell docker images -q docker/php70),)
	$(call build_php70)
endif
	$(PHP70) php project-manager/console.php init-api
.PHONY: init-api

## Initialize the Marketplace
init-mkp:
	echo "Building marketplace..."
	rm -rf marketplace
	$(call composer_env)
ifeq ($(shell docker images -q docker/php70),)
	$(call build_php70)
endif
	$(PHP70) php project-manager/console.php init-mkp
.PHONY: init-mkp

## Build Marketplace assets
build-mkp-assets:
ifneq ($(wildcard marketplace),)
	$(NPM_MKP) npm install
	$(NPM_MKP) npm rebuild node-sass
	$(NPM_MKP) npm run production
else
	make init-mkp
endif
.PHONY: build-mkp-assets

## Initialize the BO
init-bo:
	rm -rf bo
	$(call composer_env)
ifeq ($(shell docker images -q docker/php70),)
	$(call build_php70)
endif
	$(PHP70) php project-manager/console.php init-bo
.PHONY: init-bo

## Initialize the ODS
init-ods:
	rm -rf ods
	$(call composer_env)
ifeq ($(shell docker images -q docker/php70),)
	$(call build_php70)
endif
	$(PHP70) php project-manager/console.php init-ods
.PHONY: init-ods

## Initialize API database (doesn't work with Booking functionalities
init-database: start
	$(RUN_API) $(CONSOLE) doctrine:database:drop -n --if-exists --force
	$(RUN_API) $(CONSOLE) doctrine:database:create -n
	$(RUN_API) $(CONSOLE) doctrine:database:import vendor/wynd/api/data/test/dump/db_test.sql
	$(RUN_API) $(CONSOLE) doctrine:migrations:migrate -n
	$(RUN_API) $(CONSOLE) hautelook_alice:doctrine:fixtures:load -n -b WyndApiCoreBundle --append --no-debug
.PHONY: init-database

## Reset API database with wynd_api.sql script provided with current API
reset-database: start
	$(RUN_API) $(CONSOLE) doctrine:database:drop -n --if-exists --force
	$(RUN_API) $(CONSOLE) doctrine:database:create -n
	$(RUN_API) $(CONSOLE) doctrine:database:import wynd_api.sql
.PHONY: reset-database

## Initialize Elastic Search index
init-elasticsearch: start
	$(RUN_API) $(CONSOLE) fos:elastica:reset
	$(RUN_API) $(CONSOLE) fos:elastica:populate
.PHONY: init-elasticsearch

## install assets
install-front:
	$(RUN_FRONT) php ../project-manager/project-manager/console.php install-front
.PHONY: install-front

## Start the project
start:
	$(DC) up -d --build
	$(DC) run --rm wait
.PHONY: up

## Stop the project
stop:
	$(DC) down
.PHONY: stop

clear:
	$(DC) down --volumes

test-unit:
	cp docker-compose.override.ci.yml.dist docker-compose.override.yml
	cp api/.env.dist api/.env
	$(DC) run --no-deps --rm -e "SYMFONY_ENV=test" $(APP_NAME) composer install
	$(DC) run --no-deps --rm $(APP_NAME) vendor/bin/phpunit

test-cs:
	cp docker-compose.override.ci.yml.dist docker-compose.override.yml
	cp api/.env.dist api/.env
	$(DC) run --no-deps --rm -e "SYMFONY_ENV=test" $(APP_NAME) composer install
	$(DC) run --no-deps --rm $(APP_NAME) bash -c "find src -type f -name '*.php' | xargs -I {} php -l {}"
	$(DC) run --no-deps --rm $(APP_NAME) bin/console lint:yaml app
	$(DC) run --no-deps --rm $(APP_NAME) bin/console lint:yaml src
	$(DC) run --no-deps --rm $(APP_NAME) bin/console lint:twig app
	$(DC) run --no-deps --rm $(APP_NAME) bin/console lint:twig src

define build_php70
	echo "Building php 7.0 docker image"
	docker build -t docker/php70 ./docker/php70
endef

define composer_env
	if [ ! -f .composer.env ]; then\
		$(LDAP_USER)\
		$(LDAP_PASSWORD)\
		echo "\nThank you! Please wait...";\
		echo "COMPOSER_PROCESS_TIMEOUT=3600\nCOMPOSER_ALLOW_SUPERUSER=1\nCOMPOSER_AUTH={\"http-basic\": {\"satis.wynd.eu\": {\"username\": \"$$ldap_username\", \"password\": \"$$ldap_password\"}}}" > .composer.env;\
	fi;
endef

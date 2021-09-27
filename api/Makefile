COMPOSER ?= composer
DOCKER_COMPOSE = docker-compose
PROJECT = "Monitoring App."
PHP_CMD = php
PHP_SERVICE = api
CMD := docker-compose exec $(PHP_SERVICE)

composer-install:
	@echo "\n==> Running composer install, runner $(RUNNER)"
	$(CMD) $(COMPOSER) install

cc:
	@echo "\n==> Clearing cache"
	rm -rf var/cache/*

clear: cc
	@echo "\n==> Cleaning project and starting up fresh"
	rm -rf vendor/* var/logs/* var/log/* bin/php* coverage/

lint: lint-json lint-yaml lint-php phpcs lint-composer lint-eol
	@echo All good.

lint-eol:
	@echo "\n==> Validating unix style line endings of files:"
	@! grep -lIUr --color '^M' app/ web/ src/ composer.* || ( echo '[ERROR] Above files have CRLF line endings' && exit 1 )
	@echo All files have valid line endings

lint-composer:
	@echo "\n==> Validating composer.json and composer.lock:"
	$(CMD) $(COMPOSER) validate --strict

lint-json:
	@echo "\n==> Validating all json files:"
	@find src -type f -name \*.json -o -name \*.schema | php -R 'echo "$$argn\t\t";json_decode(file_get_contents($$argn));if(json_last_error()!==0){echo "<-- invalid\n";exit(1);}else{echo "\n";}'

lint-yaml:
	@echo "\n==> Validating all yaml files:"
	@find app/config src -type f -name \*.yml | while read file; do echo -n "$$file"; $(CMD) php bin/console --no-debug --no-interaction --env=test lint:yaml "$$file" || exit 1; done

lint-php:
	@echo "\n==> Validating all php files:"
	$(CMD) find src -type f -iname '*php' -exec $(PHP_CMD) -l {} \;

phpcs:
	@echo "\n==> Checking php styles"
	$(CMD) vendor/bin/phpcs --standard=phpcs.xml -p

phpcbf:
	@echo "\n==> Fixing styling errors"
	$(CMD) vendor/bin/phpcbf

.PHONY: composer-install cc clear lint lint-eol lint-composer lint-json lint-php lint-yaml phpcbf phpcs

-include api/Makefile
DOCKER_COMPOSE = docker-compose
PROJECT = "Monitoring App"
COMPOSE_PROJECT_NAME ?= $(notdir $(shell pwd))


help:
	@ echo "Usage: make <target>\n"
	@ echo "Available targets:\n"
	@ cat Makefile api/Makefile | grep -oE "^[^: ]+:" | grep -oE "[^:]+" | grep -Ev "help|default|.PHONY"

container-stop:
	@echo "\n==> Stopping docker container"
	$(DOCKER_COMPOSE) stop

container-down:
	@echo "\n==> Removing docker container"
	$(DOCKER_COMPOSE) down

container-remove:
	@echo "\n==> Removing docker container(s)"
	$(DOCKER_COMPOSE) rm

container-up:
	@echo "\n==> Docker container building and starting ..."
	$(DOCKER_COMPOSE) up --build -d

tear-down: container-stop container-down container-remove

all: clear container-up composer-install lint-composer lint-php lint-json lint-yaml lint-eol phpcs

.PHONY: help all container-down container-remove container-stop container-up

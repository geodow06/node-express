COMPOSE_FILE := docker-compose.yml
DEV_COMPOSE_FILE := docker-compose.dev.yml
PROD_COMPOSE_FILE := docker-compose.prod.yml
REGISTRY := geodow06

THIS_FILE := $(lastword $(MAKEFILE_LIST))
CMD_ARGUMENTS ?= $(cmd)

.PHONY: help build-dev build-prod build-prod-image

build-dev:
	docker-compose -f $(COMPOSE_FILE) -f $(DEV_COMPOSE_FILE) build --no-cache $(c)

up-dev:
	docker-compose -f $(COMPOSE_FILE) -f $(DEV_COMPOSE_FILE) up -d $(c)

build-prod:
	docker-compose -f $(COMPOSE_FILE) -f $(PROD_COMPOSE_FILE) build --no-cache $(c)

up-prod:
	docker-compose -f $(COMPOSE_FILE) -f $(PROD_COMPOSE_FILE) up -d $(c)

destroy:
	docker-compose down -v $(c)

build-prod-image:
	docker build -t $(REGISTRY)/node-express:prod --build-arg NODE_ENV=production -f ./prod/Dockerfile --no-cache .

push-prod-image:
	docker image push $(REGISTRY)/node-express:prod


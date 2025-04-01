SHELL := /bin/bash

.PHONY: all 
all: build up

.PHONY: build 
build:
	@docker-compose build

.PHONY: up
up:
	@docker-compose up -d

.PHONY: down
down:
	@docker-compose down

.PHONY: restart
restart: down all

.PHONY: logs
logs:
	@docker-compose logs -f  --tail 100

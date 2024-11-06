SHELL := /bin/bash

include .env

TRAEFIK := docker-compose.traefik.yml
DATABASES := docker-compose.databases.yml
BACKEND := docker-compose.backend.yml

COMPOSE_FILES := -f $(TRAEFIK) -f $(DATABASES) -f $(BACKEND)

.PHONY: all
all: down-all network-all rebuild-all start-all clear-prune

.PHONY: network-all
network-all: rm-network create-network

.PHONY: create-network
create-network:
	@docker network create 33routes_backend_network

.PHONY: rm-network
rm-network:
	@docker network rm 33routes_backend_network || true

.PHONY: build-all
build-all: build-traefik build-databases build-backend

.PHONY: build-traefik
build-traefik:
	@docker compose -f $(TRAEFIK) build

.PHONY: build-databases
build-databases:
	@docker compose -f $(DATABASES) build

.PHONY: build-backend
build-backend:
	@docker compose -f $(BACKEND) build

.PHONY: rebuild-all
rebuild-all: rebuild-traefik rebuild-databases rebuild-backend

.PHONY: rebuild-traefik
rebuild-traefik:
	@docker compose -f $(TRAEFIK) build --no-cache --force-rm

.PHONY: rebuild-databases
rebuild-databases:
	@docker compose -f $(DATABASES) build --no-cache --force-rm

.PHONY: rebuild-backend
rebuild-backend:
	@docker compose -f $(BACKEND) build --no-cache --force-rm

.PHONY: start-all
start-all: start-traefik start-databases start-backend

.PHONY: start-traefik
start-traefik:
	@docker compose -f $(TRAEFIK) up -d --build

.PHONY: start-databases
start-databases:
	@docker compose -f $(DATABASES) up -d --build

.PHONY: start-backend
start-backend:
	@docker compose -f $(BACKEND) up -d --build

.PHONY: down-all
down-all: down-backend down-traefik down-databases

.PHONY: down-traefik
down-traefik:
	@docker compose -f $(TRAEFIK) down || true

.PHONY: down-databases
down-databases:
	@docker compose -f $(DATABASES) down || true

.PHONY: down-backend
down-backend:
	@docker compose -f $(BACKEND) down || true

.PHONY: restart
restart: down-all start-all

.PHONY: logs
logs:
	@docker compose $(COMPOSE_FILES) logs -f --tail 100

.PHONY: pg-cli
pg-cli:
	@docker exec -it $(POSTGRES_CONTAINER_NAME) psql -U $(POSTGRES_USER) -d $(POSTGRES_DB)

.PHONY: pg-seed-data
pg-seed-data:
	@docker exec -i $(POSTGRES_CONTAINER_NAME) psql -U $(POSTGRES_USER) -d $(POSTGRES_DB) < ./database/postgres/test_data/seed_data.sql

.PHONY: rm-pg-data
rm-pg-data:
	@rm -rf database/postgres/data && \
	mkdir database/postgres/data

.PHONY: clear-all
clear-all: clear rm-pg-data

.PHONY: clear
clear:
	@docker compose $(COMPOSE_FILES) down --remove-orphans || true
	
.PHONY: clear-prune
clear-prune:
	@docker system prune -f
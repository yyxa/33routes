SHELL := /bin/bash

include .env

TRAEFIK := docker-compose.traefik.yml
DATABASES := docker-compose.databases.yml
BACKEND := docker-compose.backend.yml
BACKEND_PROD := docker-compose.backend-prod.yml

ifeq ($(PROD),1)
    BACKEND := $(BACKEND_PROD)
endif

COMPOSE_FILES := -f $(TRAEFIK) -f $(DATABASES) -f $(BACKEND)

.PHONY: all
all: down-all network-all rebuild-all start-all
# all: clear-image down-all network-all rebuild-all start-all

.PHONY: database-all
database-all: down-databases rebuild-databases start-databases

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
	@docker exec -i $(POSTGRES_CONTAINER_NAME) psql -U $(POSTGRES_USER) -d $(POSTGRES_DB) < ../data/test_data/seed_data.sql
	@for file in ../data/sql/*.sql; do \
		if [ -f "$$file" ]; then \
			echo "Загрузка $$file..."; \
			docker exec -i $(POSTGRES_CONTAINER_NAME) psql -U $(POSTGRES_USER) -d $(POSTGRES_DB) < "$$file"; \
		fi \
	done
	
.PHONY: rm-pg-data
rm-pg-data:
	@rm -rf database/postgres/data

.PHONY: clear-all
clear-all: clear rm-pg-data

.PHONY: clear
clear:
	@docker compose $(COMPOSE_FILES) down --remove-orphans || true
	
.PHONY: clear-image
clear-image:
	@docker image prune -f

.PHONY: tests-all
tests-all:
	$(MAKE) tests-collection && \
	$(MAKE) tests-comment && \
	$(MAKE) tests-moderation && \
	$(MAKE) tests-review && \
	$(MAKE) tests-route && \
	$(MAKE) tests-image && \
	$(MAKE) tests-search && \
	$(MAKE) tests-auth && \
	$(MAKE) tests-user

.PHONY: tests-collection
tests-collection: check-venv
	@.venv/bin/python -m pytest collection_service/tests/tests.py

.PHONY: tests-comment
tests-comment: check-venv	
	@.venv/bin/python -m pytest comment_service/tests/tests.py

.PHONY: tests-moderation
tests-moderation: check-venv
	@.venv/bin/python -m pytest moderation_service/tests/tests.py

.PHONY: tests-review
tests-review: check-venv
	@.venv/bin/python -m pytest review_service/tests/tests.py

.PHONY: tests-route
tests-route: check-venv
	@.venv/bin/python -m pytest route_service/tests/tests.py

.PHONY: tests-image
tests-image: check-venv
	@.venv/bin/python -m pytest image_service/tests/tests.py

.PHONY: tests-search
tests-search: check-venv
	@.venv/bin/python -m pytest search_service/tests/tests.py

.PHONY: tests-auth
tests-auth: check-venv
	@.venv/bin/python -m pytest auth_service/tests/tests.py

.PHONY: tests-user
tests-user: check-venv
	@.venv/bin/python -m pytest user_service/tests/tests.py

.PHONY: dev-install
dev-install:
	@sudo apt install python3 python3-venv
	python3 -m venv .venv
	.venv/bin/python3 -m pip install -U pip
	.venv/bin/pip install -r requirements.txt

.PHONY: check-venv
check-venv:
	@[ -d ".venv" ] || (echo "Virtual environment not found. Run 'make dev-install' first."; exit 1)

DIRS = collection_service comment_service image_service moderation_service review_service route_service image_service search_service auth_service user_service

.PHONY: update-env
update-env:
	@for dir in $(DIRS); do \
	    rm -f $$dir/.env; \
	    cp .env $$dir/.env; \
	done
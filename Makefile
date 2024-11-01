SHELL := /bin/bash

.PHONY: backend
backend: 
	@cd backend && \
	$(MAKE) all

.PHONY: frontend
frontend:
	@cd frontend && \
	$(MAKE) all

.PHONY: swagger
swagger:
	@docker run -d \
	--name=33routes_swagger-ui \
	--restart=always \
	-p 8081:8080 \
	-e SWAGGER_JSON=/api/swagger.yaml \
	-v ./swagger.yaml:/api/swagger.yaml \
	swaggerapi/swagger-ui

.PHONY: monitoring-up
monitoring-up:
	@cd devops && \
	docker compose up -d

.PHONY: monitoring-down
monitoring-down:
	@cd devops && \
	docker compose down
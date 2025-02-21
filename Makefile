SHELL := /bin/bash

.PHONY: backend
backend: 
	@cd backend && \
	$(MAKE) all

.PHONY: frontend
frontend:
	@cd frontend && \
	$(MAKE) all

.PHONY: frontend-admin
frontend-admin:
	@cd frontend_admin && \
	$(MAKE) all

.PHONY: swagger
swagger:
	@docker run -d \
	--name=33routes_swagger-ui \
	--restart=always \
	-p 127.0.0.1:8081:8080 \
	-e SWAGGER_JSON=/api/swagger.yaml \
	-v ./docs/swagger.yaml:/api/swagger.yaml \
	swaggerapi/swagger-ui:v5.18.1
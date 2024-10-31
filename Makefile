SHELL := /bin/bash

.PHONY: backend
backend: 
	cd backend && \
	$(MAKE) all

.PHONY: frontend
frontend:
	cd frontend && \
	$(MAKE) all

.PHONY: swagger
swagger:
	docker run -d --name 33routes_swagger-ui -p 8081:8080 -e SWAGGER_JSON=/api/swagger.yaml -v ./swagger.yaml:/api/swagger.yaml swaggerapi/swagger-ui
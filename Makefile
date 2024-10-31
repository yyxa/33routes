SHELL := /bin/bash

.PHONY: backend
backend: 
	cd backend && \
	$(MAKE) all

.PHONY: frontend
frontend:
	cd frontend && \
	npm start
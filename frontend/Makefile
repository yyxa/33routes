SHELL := /bin/bash

.PHONY: all
all: build run

.PHONY: build
build:
	docker build -t 33routes_frontend .

.PHONY: run
run: 
	docker run -d -p 3000:3000 33routes_frontend
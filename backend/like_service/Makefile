SHELL := /bin/bash

.PHONY: local
local: conan-rebuild local-rebuild local-run

.PHONY: local-rebuild
local-rebuild:
	@(cd build && \
	source conanbuild.sh && \
	cmake -DCMAKE_BUILD_TYPE=Release .. && \
	cmake --build . && \
	source deactivate_conanbuild.sh)

.PHONY: conan-rebuild
conan-rebuild:
	@(rm -rf build/ && \
	mkdir build && \
	cd build && \
	conan install .. --profile=cxxprofile --output-folder=. --build=missing)

.PHONY: local-run
local-run:
	@./build/like_service 0.0.0.0 8100

.PHONY: tests
tests: check-venv
	@./../.venv/bin/python -m pytest tests/tests.py

.PHONY: check-venv
check-venv:
	@[ -d "./../.venv" ] || (echo "Virtual environment not found. Run 'make dev-install' first."; exit 1)
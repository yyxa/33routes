SHELL := /bin/bash

.PHONY: dev-install
dev-install:
	@sudo apt install python3 python3-venv
	python3 -m venv .venv
	.venv/bin/python3 -m pip install -U pip
	.venv/bin/pip install -r requirements.txt

.PHONY: check-venv
check-venv:
	@[ -d ".venv" ] || (echo "Virtual environment not found. Run 'make dev-install' first."; exit 1)

.PHONY: parse
parse: check-venv
	@if [ -z "$(word 2,$(MAKECMDGOALS))" ]; then \
		echo "Ошибка: Укажите путь к TCX файлу: make parse путь/к/файлу.tcx"; \
		exit 1; \
	fi
	.venv/bin/python3 parse_tcx_to_sql.py $(word 2,$(MAKECMDGOALS))

%:
	@:

.PHONY: parse-folder
parse-folder: check-venv
	.venv/bin/python3 parse_tcx_to_sql.py ../tcx

.PHONY: parse-wikiloc
parse-wikiloc: check-venv
	.venv/bin/python3 parse_tcx.py
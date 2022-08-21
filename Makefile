SHELL := bash
.ONESHELL:
.DELETE_ON_ERROR:
.SHELLFLAGS := -euo pipefail -c
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

all: setup

.PHONY: all

setup:
	@ ./scripts/setup.sh

.PHONY: setup

dbmate/up:
	dbmate up

.PHONY: dbmate/up

dbmate/down:
	dbmate down

.PHONY: dbmate/down

local:
	docker compose up -d --build

.PHONY: local

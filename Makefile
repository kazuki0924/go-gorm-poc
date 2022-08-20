SHELL := bash
.ONESHELL:
.DELETE_ON_ERROR:
.SHELLFLAGS := -euo pipefail -c
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

all: setup

.PHONY: all

setup:
	@ ./scripts/setup_and_install_with_pip.sh
	# requires Homebrew to be installed:
	brew bundle --verbose --no-lock --file=Brewfile
	# requires MacPorts to be installed:
	sudo port install pgmodeler

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

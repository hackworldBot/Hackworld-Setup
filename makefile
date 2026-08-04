.PHONY: lint format test

lint:
	shellcheck install.sh lib/*.sh modules/*.sh

format:
	shfmt -w .

test:
	@echo "Tests à venir..."
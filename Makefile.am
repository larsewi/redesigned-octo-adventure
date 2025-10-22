ACLOCAL_AMFLAGS = -I m4
SUBDIRS = src . tests

.PHONY: format check-format super-clean

format:
	shfmt --write --simplify --list **/*.sh

check-format:
	shfmt --diff --simplify --list **/*.sh

super-clean:
	if command -v git; then git clean -fxd; fi

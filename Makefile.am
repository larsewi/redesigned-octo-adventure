ACLOCAL_AMFLAGS = -I m4
SUBDIRS = src . tests

.PHONY: format check-format super-clean

if HAVE_SHFMT
format:
	@SHFMT@ --write --simplify --list $$(find . -name '*.sh' -type f)

check-format:
	@SHFMT@ --diff --simplify --list $$(find . -name '*.sh' -type f)
endif

if HAVE_SHFMT
super-clean:
	@GIT@ clean -fxd
endif

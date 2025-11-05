ACLOCAL_AMFLAGS = -I m4
SUBDIRS = src . tests

.PHONY: format check-format super-clean

if HAVE_SHFMT
format:
	@GIT@ ls-files '*.sh' | xargs -r @SHFMT@ --write --simplify --list

check-format:
	@SHFMT@ --diff --simplify --list $$(git ls-files '*.sh')
endif

if HAVE_SHFMT
super-clean:
	@GIT@ clean -fxd
endif

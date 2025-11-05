ACLOCAL_AMFLAGS = -I m4
SUBDIRS = src . tests

.PHONY: format check-format super-clean

if HAVE_SHFMT
format:
	@SHFMT@ --write --simplify --list ${srcdir}/src/*.sh

check-format:
	@SHFMT@ --diff --simplify --list ${srcdir}/src/*.sh
endif # HAVE_SHFMT

if HAVE_GIT
super-clean:
	@GIT@ clean -fxd
endif # HAVE_GIT

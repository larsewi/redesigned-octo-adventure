#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.71])
AC_INIT([buildscripts], [0.0.1], [https://github.com/larsewi/redesigned-octo-adventure])
AM_INIT_AUTOMAKE([-Wall -Werror foreign subdir-objects])

# Checks for programs.

AC_CHECK_PROGS([GIT], [git])
if test -z "$GIT"; then
    AC_MSG_WARN([git not found - some features may be unavailable])
fi

AC_CONFIG_TESTDIR([tests])
AC_CONFIG_FILES([Makefile
                 src/Makefile
                 src/utils/Makefile
                 tests/Makefile])

AC_OUTPUT

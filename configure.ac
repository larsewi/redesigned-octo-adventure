#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.71])
AC_INIT([buildscripts], [0.0.1], [https://github.com/larsewi/redesigned-octo-adventure])
AC_CANONICAL_HOST
AM_INIT_AUTOMAKE([-Wall -Werror foreign subdir-objects])

AC_ARG_ENABLE([debug],
              AS_HELP_STRING([--enable-debug], [whether to build with debug symbols]),
              [if test "$enableval" = yes; then
                BUILD_TYPE=debug
              else
                BUILD_TYPE=release
              fi],
              [BUILD_TYPE=debug])
AC_MSG_NOTICE([Build type is $BUILD_TYPE])

AC_ARG_ENABLE([enterprise],
              AS_HELP_STRING([--enable-enterprise], [whether to build enterprise features]),
              [if test "$enableval" = yes; then
                PROJECT=enterprise
              else
                PROJECT=community
              fi],
              [PROJECT=community])
AC_MSG_NOTICE([Project is $PROJECT])

AC_ARG_ENABLE([hub],
              AS_HELP_STRING([--enable-hub], [whether to build hub features]),
              [if test "$enableval" = yes; then
                ROLE=hub
              else
                ROLE=agent
              fi],
              [ROLE=agent])
AC_MSG_NOTICE([Role is $ROLE])

AC_ARG_WITH([core],
            AS_HELP_STRING([--with-core], [specify Core directory path (default '../core/')]),
            [CORE_DIRECTORY="$withval"],
            [CORE_DIRECTORY="../core"])
AC_MSG_NOTICE([Core path '$CORE_DIRECTORY'])

AC_ARG_WITH([masterfiles],
            AS_HELP_STRING([--with-masterfiles], [specify Masterfiles directory path (default '../masterfiles/')]),
            [MASTERFILES_DIRECTORY="$withval"],
            [MASTERFILES_DIRECTORY="../masterfiles"])
AC_MSG_NOTICE([Masterfiles path '$MASTERFILES_DIRECTORY'])

AC_ARG_WITH([enterprise],
            AS_HELP_STRING([--with-enterprise], [specify Enterprise directory path (default '../enterprise/')]),
            [ENTERPRISE_DIRECTORY="$withval"],
            [ENTERPRISE_DIRECTORY="../enterprise"])
AC_MSG_NOTICE([Enterprise directory path '$ENTERPRISE_DIRECTORY'])

AC_ARG_WITH([nova],
            AS_HELP_STRING([--with-nova], [specify Nova directory path (default '../nova/')]),
            [NOVA_DIRECTORY="$withval"],
            [NOVA_DIRECTORY="../nova"])
AC_MSG_NOTICE([Nova directory path '$NOVA_DIRECTORY'])

AC_ARG_WITH([mission-portal],
            AS_HELP_STRING([--with-mission-portal], [specify Mission Portal directory path (default '../mission-portal/')]),
            [MISSION_PORTAL_DIRECTORY="$withval"],
            [MISSION_PORTAL_DIRECTORY="../mission-portal"])
AC_MSG_NOTICE([Mission Portal directory path '$MISSION_PORTAL_DIRECTORY'])

# Checks for programs.

AC_CHECK_PROGS([GIT], [git])
if test -n "$GIT"; then
    AM_CONDITIONAL([HAVE_GIT], [test -n "$GIT"])
else
    AC_MSG_WARN([git not found - some features may be unavailable])
fi

AC_CHECK_PROGS([SHFMT], [shfmt])
if test -n "$SHFMT"; then
    AM_CONDITIONAL([HAVE_SHFMT], [test -n "$SHFMT"])
else
    AC_MSG_WARN([shfmt not found - some features may be unavailable])
fi

AC_CONFIG_TESTDIR([tests])
AC_CONFIG_FILES([Makefile
                 src/Makefile
                 src/utils/Makefile
                 tests/Makefile])

AC_OUTPUT

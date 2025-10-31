#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.71])
AC_INIT([buildscripts], [0.0.1], [https://github.com/larsewi/redesigned-octo-adventure])
AM_INIT_AUTOMAKE([-Wall -Werror foreign subdir-objects])

AC_CANONICAL_HOST
AC_SUBST([host_cpu])
AC_SUBST([host_os])

AX_COUNT_CPUS
AC_SUBST([CPU_COUNT])

# Configure features

AC_ARG_ENABLE([debug],
              AS_HELP_STRING([--enable-debug], [whether to build with debug symbols]),
              [if test "$enableval" = yes; then
                BUILD_TYPE=debug
              else
                BUILD_TYPE=release
              fi],
              [BUILD_TYPE=debug])
AC_MSG_NOTICE([Build type is $BUILD_TYPE])
AC_SUBST([BUILD_TYPE])

AC_ARG_ENABLE([enterprise],
              AS_HELP_STRING([--enable-enterprise], [whether to build enterprise features]),
              [if test "$enableval" = yes; then
                PROJECT=enterprise
              else
                PROJECT=community
              fi],
              [PROJECT=community])
AC_MSG_NOTICE([Project is $PROJECT])
AC_SUBST([PROJECT])
AM_CONDITIONAL([HAVE_ENTERPRISE], [test "$PROJECT" = enterprise])

AC_ARG_ENABLE([hub],
              AS_HELP_STRING([--enable-hub], [whether to build hub features]),
              [if test "$enableval" = yes; then
                ROLE=hub
              else
                ROLE=agent
              fi],
              [ROLE=agent])
AC_MSG_NOTICE([Role is $ROLE])
AC_SUBST([ROLE])
AM_CONDITIONAL([HAVE_HUB], [test "$ROLE" = enterprise])

# Configure branches

AC_ARG_WITH([base-branch],
            AS_HELP_STRING([--with-base-branch], [with base branch]),
            [BASE_BRANCH="export BASE_BRANCH=\"$withval\""],
            [BASE_BRANCH="export BASE_BRANCH="master""])
AC_SUBST([BASE_BRANCH])

AC_ARG_WITH([core-branch],
            AS_HELP_STRING([--with-core-branch], [with core branch]),
            [CORE_BRANCH="export CORE_BRANCH=\"$withval\""],
            [CORE_BRANCH="# export CORE_BRANCH="])
AC_SUBST([CORE_BRANCH])

AC_ARG_WITH([masterfiles],
            AS_HELP_STRING([--with-masterfiles-branch], [with masterfiles branch]),
            [MASTERFILES_BRANCH="export MASTERFILES_BRANCH=\"$withval\""],
            [MASTERFILES_BRANCH="# export MASTERFILES_BRANCH="])
AC_SUBST([MASTERFILES_BRANCH])

AC_ARG_WITH([enterprise],
            AS_HELP_STRING([--with-enterprise-branch], [with enterprise branch]),
            [ENTERPRISE_BRANCH="export ENTERPRISE_BRANCH=\"$withval\""],
            [ENTERPRISE_BRANCH="# export ENTERPRISE_BRANCH="])
AC_SUBST([ENTERPRISE_BRANCH])

AC_ARG_WITH([nova],
            AS_HELP_STRING([--with-nova-branch], [with nova branch]),
            [NOVA_BRANCH="export NOVA_BRANCH\"$withval\""],
            [NOVA_BRANCH="# export NOVA_BRANCH="])
AC_SUBST([NOVA_BRANCH])

AC_ARG_WITH([mission-portal],
            AS_HELP_STRING([--with-mission-portal-branch], [with mission-portal branch]),
            [MISSION_PORTAL_BRANCH="export MISSION_PORTAL_BRANCH=\"$withval\""],
            [MISSION_PORTAL_BRANCH="# export MISSION_PORTAL_BRANCH="])
AC_SUBST([MISSION_PORTAL_BRANCH])

# Configure local repositories

AC_ARG_WITH([core],
            AS_HELP_STRING([--with-core], [with local core project]),
            [CORE_PATH="export CORE_PATH=\"$withval\""],
            [CORE_PATH="# export CORE_PATH="])
AC_SUBST([CORE_PATH])

AC_ARG_WITH([masterfiles],
            AS_HELP_STRING([--with-masterfiles], [with local masterfiles project]),
            [MASTERFILES_PATH="export MASTERFILES_PATH=\"$withval\""],
            [MASTERFILES_PATH="# export MASTERFILES_PATH="])
AC_SUBST([MASTERFILES_PATH])

AC_ARG_WITH([enterprise],
            AS_HELP_STRING([--with-enterprise], [with local enterprise project]),
            [ENTERPRISE_PATH="export ENTERPRISE_PATH=\"$withval\""],
            [ENTERPRISE_PATH="# export ENTERPRISE_PATH="])
AC_SUBST([ENTERPRISE_PATH])

AC_ARG_WITH([nova],
            AS_HELP_STRING([--with-nova], [with local nova project]),
            [NOVA_PATH="export NOVA_PATH\"$withval\""],
            [NOVA_PATH="# export NOVA_PATH="])
AC_SUBST([NOVA_PATH])

AC_ARG_WITH([mission-portal],
            AS_HELP_STRING([--with-mission-portal], [with local mission-portal project]),
            [MISSION_PORTAL_PATH="export MISSION_PORTAL_PATH=\"$withval\""],
            [MISSION_PORTAL_PATH="# export MISSION_PORTAL_PATH="])
AC_SUBST([MISSION_PORTAL_PATH])

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

AC_PATH_PROGS([RSYNC], [rsync])
if test -z "$RSYNC"; then
    AC_MSG_ERROR([rsync not found])
fi

AC_PATH_PROGS([MAKE], [gmake make])
if test -z "$MAKE"; then
    AC_MSG_ERROR([make not found])
fi

AC_PATH_PROGS([FUSER], [fuser])
if test -z "$FUSER"; then
    AC_MSG_ERROR([fuser not found])
fi

AC_PATH_PROGS([PATCH], [gpatch patch])
if test -z "$PATCH"; then
    AC_MSG_ERROR([patch not found])
fi

AC_CONFIG_TESTDIR([tests])
AC_CONFIG_FILES([Makefile
                 config.sh
                 src/Makefile
                 tests/Makefile])

AC_OUTPUT

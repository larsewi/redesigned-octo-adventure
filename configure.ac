#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.71])
AC_INIT([buildscripts], [0.0.1], [https://github.com/larsewi/redesigned-octo-adventure])
AC_CANONICAL_HOST
AM_INIT_AUTOMAKE([-Wall -Werror foreign subdir-objects])

AC_ARG_ENABLE([PROJECT],
              AS_HELP_STRING([--project], [whether to build enterprise or community package (default=community)])
              [PROJECT=$enableval],
              [PROJECT=community])
case "$PROJECT" in
community|hub)
    AC_MSG_NOTICE([Using project $PROJECT])
    ;;
*)
    AC_MSG_ERROR([Unsupported project '$PROJECT'])
    ;;
esac

AC_ARG_ENABLE([role],
              AS_HELP_STRING([--role], [whether to build hub or client package (default=agent)]),
              [ROLE="$enableval"],
              [ROLE=agent])
case "$ROLE" in
agent|hub)
    AC_MSG_NOTICE([Using role $ROLE])
    ;;
*)
    AC_MSG_ERROR([Unsupported role '$ROLE'])
    ;;
esac

AC_ARG_WITH([core],
            AS_HELP_STRING([--with-core], [specify core directory path (default '../core/')]),
            [CORE_DIRECTORY="$withval"],
            [CORE_DIRECTORY="../core"])
if test -d "$CORE_DIRECTORY"; then
    AC_MSG_NOTICE([Using core directory path '$CORE_DIRECTORY'])
else
    AC_MSG_ERROR([Core path '$CORE_DIRECTORY' is not a directory])
fi

AC_ARG_WITH([masterfiles],
            AS_HELP_STRING([--with-masterfiles], [specify masterfiles directory path (default '../masterfiles/')]),
            [MASTERFILES_DIRECTORY="$withval"],
            [MASTERFILES_DIRECTORY="../masterfiles"])
if test -d "$MASTERFILES_DIRECTORY"; then
    AC_MSG_NOTICE([Using masterfiles directory path '$MASTERFILES_DIRECTORY'])
else
    AC_MSG_ERROR([Masterfiles path '$MASTERFILES_DIRECTORY' is not a directory])
fi

# Checks for host.
AC_MSG_CHECKING([for host os])
case $host_os in
linux*)
    AC_MSG_RESULT([linux])
    ;;
*)
    # TODO: Add support for more operating systems
    AC_MSG_ERROR(["Unsupported host OS '$host_os'"])
    ;;
esac

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

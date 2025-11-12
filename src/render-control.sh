#!/usr/bin/env sh
#
# render-control.sh: Render package control file (required by deb packaging tool)
# Args:
#   $1 - Package name (e.g., 'curl')
#

PACKAGE_NAME="$1"

mkdir "$PACKAGE_NAME-$PACKAGE_VERSION/debian"
cat <<EOF >"$PACKAGE_NAME"-"$PACKAGE_VERSION"/debian/changelog
Source: cfbuild-lib$PACKAGE_NAME
Maintainer: CFEngine Packager <packager@cfengine.com>
Section: libs
Priority: optional
Standards-Version: 4.7.0
Build-Depends: debhelper-compat (= 13)

Package: cfbuild-libcurl
Architecture: any
Section: libs
Description: CFEngine Build Automation -- libcurl
 CFEngine Build Automation -- libcurl

Package: cfbuild-libcurl-devel
Architecture: any
Section: libdevel
Description: CFEngine Build Automation -- libcurl -- development files
  CFEngine Build Automation -- libcurl -- development files
EOF

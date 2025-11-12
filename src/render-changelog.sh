#!/usr/bin/env sh
#
# render-changelog.sh: Render package changelog file (required by deb packaging tool)
# Args:
#   $1 - Package name (e.g., 'curl')
#   $2 - Package version (e.g., '8.16.0')
#   $3 - Build date (e.g., 'Wed, 05 Nov 2025 16:38:12 +010')
#

PACKAGE_NAME="$1"
PACKAGE_VERSION="$2"
BUILD_DATE="$3"

mkdir "$PACKAGE_NAME-$PACKAGE_VERSION/debian"
cat <<EOF >"$PACKAGE_NAME"-"$PACKAGE_VERSION"/debian/changelog
cfbuild-$PACKAGE_NAME ($PACKAGE_VERSION) unstable; urgency=low

  * New build.

 -- CFEngine Autobuild System <packager@cfengine.com>  $BUILD_DATE
EOF

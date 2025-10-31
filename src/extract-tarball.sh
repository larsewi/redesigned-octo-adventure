#!/usr/bin/env sh
#
# extract-tarball.sh - Extract tarball
#
# This script extracts a tarball from a specified source TARBALL
#
# Usage:
#   extract-tarball.sh TARBALL
#
# Arguments:
#   TARBALL   - Path to tarball source
#
# Exit codes:
#   0 - Success (tarball is extracted)
#   1 - Failure (tarball extraction failed)
#

set -e

TARBALL=$1

log_debug "Extracting tarball '$TARBALL'..."
if ! tar -xf $TARBALL; then
    log_error "Failed to extract tarball '$TARBALL'..."
fi

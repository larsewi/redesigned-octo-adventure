#!/usr/bin/env sh
#
# fetch-tarball.sh - Download and verify tarball integrity
#
# This script downloads a tarball from a specified source URL and verifies
# its integrity using SHA256 checksum validation on checksums.txt.
#
# Usage:
#   fetch-tarball.sh SOURCE TARBALL
#
# Arguments:
#   SOURCE   - Base URL or path where the tarball is located
#   TARBALL  - Name of the tarball file to download
#
# Exit codes:
#   0 - Success (tarball downloaded and verified)
#   1 - Failure (download failed or checksum mismatch)
#

set -e

SOURCE=$1
TARBALL=$2

log_info "Fetching tarball '$TARBALL'..."
run_and_print_on_failure "$WGET" "$BUILD_DIR/$SOURCE/$TARBALL"

log_info "Verifying integrity of '$TARBALL'..."
if ! "$SHA256SUM" --check --ignore-missing --quiet checksums.txt; then
    log_info "Deleting '$TARBALL'..."
    rm -f "$TARBALL"
    log_fatal "Could not verify integrity of tarball '$TARBALL'..."
fi

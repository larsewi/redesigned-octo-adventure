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

. "$(dirname "$0")"/utils.sh

SOURCE=$1
TARBALL=$2

log_debug "Fetching tarball $TARBALL..."
run_and_print_on_failure "$WGET" "$SOURCE/$TARBALL"

log_debug "Verifying checksum '$CHECKSUM' of tarball $TARBALL..."
if ! "$SHA256SUM" --check --ignore-missing checksums.txt; then
    log_error "Failed to verify integrity of '$TARBALL'"
    log_info "Deleting '$TARBALL'..."
    rm -f "$TARBALL"
    exit 1
fi

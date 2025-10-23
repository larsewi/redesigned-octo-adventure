#!/bin/env sh
#
# This script is called on target 'make dist-hook'.
# It bootstraps the projects, runs 'make dist', and collects the generated tarballs.
# It should not be part of the distribution.
#
# Args:
#   $@ - Source directories (core, masterfiles, enterprise, nova, mission-portal)
# ./src/bootstrap.sh
#

. "$(dirname "$0")"/utils.sh

URI=$1
BUILD_DIR=$2

case "$URI" in
https://*)
    if [ -d "$BUILD_DIR" ]; then
        log_info "Core directory already exists '$URI' into '$BUILD_DIR'"
        git fetch
        git rebase
        git submodule update
    else
        log_info "Cloning repository '$URI' into '$BUILD_DIR'"
        git clone --recursive "$URI" "$BUILD_DIR"
    fi
    ;;
*)
    log_info "Copying directory '$URI' into '$BUILD_DIR'"
    rsync -a "$URI" "$BUILD_DIR"
    ;;
esac

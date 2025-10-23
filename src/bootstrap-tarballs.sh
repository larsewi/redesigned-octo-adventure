#!/bin/env sh
#
# This script is called on target 'dist-hook'.
# It should not be part of the distribution.
#
# Args:
#   $@ - Source directories (core, masterfiles, enterprise, nova, mission-portal)
# ./src/bootstrap.sh
#

. "$(dirname "$0")"/utils.sh

for src in $@; do
    log_info "Hello $src"
done

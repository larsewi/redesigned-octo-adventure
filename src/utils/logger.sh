#!/bin/env sh
#
# Never run this script! Always source it with:
# . "$(dirname "$0")"/utils/logger.sh
#

# log_debug: Print a debug message with script name prefix
# Args:
#   $@ - Debug message
log_debug() {
    echo "$(basename "$0"): debug:" "$@"
}

# log_info: Print an info message with script name prefix
# Args:
#   $@ - Info message
log_info() {
    echo "$(basename "$0"): info:" "$@"
}

# log_error: Print an error message to stderr with script name prefix
# Args:
#   $@ - Error message
log_error() {
    echo "$(basename "$0"): error:" "$@" >&2
}

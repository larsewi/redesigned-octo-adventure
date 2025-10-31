#!/usr/bin/env sh
#
# Never run this script! Always source it with:
# source "$(dirname "$0")"/utils.sh
#

set -x

. "$(BUILD_DIR)"/config.sh

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
	echo "$(basename "$0"): error:" "$@" 1>&2
}

# log_fatal: Print an fatal message to stderr with script name prefix and exit 1
# Args:
#   $@ - Fatal message
log_fatal() {
	echo "$(basename "$0"): fatal:" "$@" 1>&2
	exit 1
}

# run_and_print_on_failure: Run command and only show output on failure or warnings
# Args:
#   $@ - Command to execute with arguments
# Returns:
#   Exit code from command
# Output:
#   Normally silent; shows warnings/errors on success, full output on failure
run_and_print_on_failure() {
    local temp_output_file
    temp_output_file=$(mktemp)

    local exit_code=0
    if "$@" >"$temp_output_file" 2>&1; then
        # Filter output on Warnings/Errors and add two lines of context
        local regex
        regex='([Ww]arning:|[Ee]rror:)'
        if $GREP -q -E "$regex" "$temp_output_file"; then
            log_debug "Found warnings/errors in output from command:" "$@"
            echo "--- Start of Warnings/Errors ---"
            $GREP -c2 -E "$regex" "$temp_output_file"
            echo "--- End of Warnings/Errors ---"
        fi
    else
        # Print all output
        exit_code=$? # Store exit code for later
        log_error "Failed to run:" "$@"
        echo "--- Start of Output ---"
        cat "$temp_output_file"
        echo "--- End of Output (Error Code: $exit_code) ---"
    fi

    rm -f "$temp_output_file"
    return $exit_code
}

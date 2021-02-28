#!/bin/bash
# shellcheck disable=SC2038

readonly BASE_DIR="$(dirname "$(dirname "$(realpath "$0")")")"

# Filter script files by shebang and `shellcheck` them
find "$BASE_DIR" -type f \
    -not -path "$BASE_DIR/.git*" \
    -not -path "$BASE_DIR/dotfiles/vim*" \
    -not -path "$BASE_DIR/dotfiles/shell.d/plugins*" \
    -exec grep -E -ls '^#!(.*/|.*env +)(sh|bash|ksh)' {} \; \
    | xargs shellcheck -e SC1090

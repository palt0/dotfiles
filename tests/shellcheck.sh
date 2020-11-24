#!/bin/bash
# shellcheck disable=SC2038

# Filter script files by shebang and `shellcheck` them
find .. -type f -not -path '*.git*' \
    -exec grep -E -ls '^#!(.*/|.*env +)(sh|bash|ksh)' {} \; \
    | xargs shellcheck -e SC1090

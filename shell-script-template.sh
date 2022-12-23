#!/usr/bin/env bash

# Source: https://sharats.me/posts/shell-script-best-practices/
# Use shellcheck. Heed its warnings. https://www.shellcheck.net/

set -o errexit
set -o nounset
set -o pipefail
if [[ "${TRACE-0}" == "1" ]]; then
    set -o xtrace
fi

# Use [[ ]] for conditions
if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./script.sh arg-one arg-two

This is an awesome bash script to make your life better.

'
    exit
fi

# Always quote variable accesses with double-quotes
# If appropriate, change to the script’s directory close to the start of the script
cd "$(dirname "$0")"

main() {
    echo do awesome stuff
}

main "$@"

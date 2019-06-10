#!/bin/bash

set -o nounset
set -o errexit
set -o pipefail

WIDTH=${1:-0}
BREADTH=${2:-0}
DEPTH=${3:-0}

is_integer() {
    if [ "$1" -eq "$1" ] 2>/dev/null
    then
        return 0
    else
        return 1
    fi
}

is_dimension() {
    if [ "$1" -ge 2 ] 2>/dev/null
    then
        return 0
    else
        return 1
    fi
}

is_valid_arg() {
    if [ -n "${1}" ] && is_integer "${1}" && is_dimension "${1}" 
    then
        return 0
    else
        return 1
    fi
}

usage_and_exit() {
    echo "usage: shokunin width depth height"

    exit 1
}

if is_valid_arg "$WIDTH" && is_valid_arg "$BREADTH" && is_valid_arg "$DEPTH"
then
    ./src/destination.sh "$WIDTH" "$BREADTH" "$DEPTH"
    exit 0
fi

usage_and_exit

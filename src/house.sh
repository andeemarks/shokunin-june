#!/bin/bash
WIDTH=${1}
BREADTH=${2}
DEPTH=${3}

generate_destination() {
    DEST=( $(( ( RANDOM % WIDTH )  + 1 )) $(( ( RANDOM % BREADTH )  + 1 )) $(( ( RANDOM % DEPTH )  + 1 )) )
}

echo "Building Game with dimensions $WIDTH $BREADTH $DEPTH"
generate_destination
echo "You need to find your way to (${DEST[*]})"
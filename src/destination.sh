#!/bin/bash
WIDTH=${1}
BREADTH=${2}
DEPTH=${3}
ORIGIN=(1 1 1)
DEST=(1 1 1)

elements_equal() {
    if [ "${DEST[$1]}" == "${ORIGIN[$1]}" ] 
    then
        return 0
    fi
    return 1
}

generate_destination() {
    while elements_equal 0 && elements_equal 1 && elements_equal 2
    do
        DEST=( $(( ( RANDOM % WIDTH )  + 1 )) $(( ( RANDOM % BREADTH )  + 1 )) $(( ( RANDOM % DEPTH )  + 1 )) )
    done
}

generate_destination
echo "${DEST[0]}"
echo "${DEST[1]}"
echo "${DEST[2]}"

exit 0
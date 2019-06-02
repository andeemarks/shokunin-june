#!/bin/bash

echo $1

if [ -n "$1" ] && [ "$1" -ge 2 ] && [ -n "$2" ] && [ "$2" -ge 2 ] && [ -n "$2" ] && [ "$3" -ge 2 ]
then

    exit 0
fi

echo "usage: shokunin width depth height"

exit 1
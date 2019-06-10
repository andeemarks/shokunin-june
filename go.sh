#!/bin/bash

set -o nounset
set -o errexit
set -o pipefail

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="Build Another Silly Hunt (For The Wumpus)"
TITLE="shokunin-june"
MENU="Choose one of the following options:"

OPTIONS=(1 "Test"
         2 "Lint"
         3 "Coverage")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
            bats test/
            ;;
        2)
            shellcheck -s bash src/*
            ;;
        3)
            bashcov --skip-uncovered ./test.sh
            ;;
esac
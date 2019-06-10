#!/bin/bash

CUT=./src/destination.sh
USAGE="usage: shokunin width depth height"

@test "invoking returns the destination coordinates of different lines" {
  run ${CUT} 2 3 4
  [ "$status" -eq 0 ]
  [ "${lines[0]}" -le 2 ]
  [ "${lines[1]}" -le 3 ]
  [ "${lines[2]}" -le 4 ]
}

@test "destination wont ever match origin (1 1 1)" {
  local ORIGIN=(1 1 1)
  for i in {1..10}
  do
    run ${CUT} 2 2 2
    [ "$status" -eq 0 ]
    # echo "${lines[*]}"
    # echo (1 1 1)
    [ "${lines[*]}" != "${ORIGIN[*]}" ]
  done
}

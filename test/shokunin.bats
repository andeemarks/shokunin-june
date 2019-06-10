CUT=./src/shokunin.sh
USAGE="usage: shokunin width depth height"

@test "invoking without arguments prints usage" {
  run ${CUT}
  [ "$status" -eq 1 ]
  [ "${lines[0]}" = "${USAGE}" ]
}

@test "invoking without enough arguments prints usage" {
  run ${CUT} 1
  [ "$status" -eq 1 ]
  [ "${lines[0]}" = "${USAGE}" ]

  run $CUT 2 2
  [ "$status" -eq 1 ]
  [ "${lines[0]}" = "${USAGE}" ]

}

@test "invoking without numeric arguments prints usage" {
  run ${CUT} a b c
  [ "$status" -eq 1 ]
  [ "${lines[0]}" = "${USAGE}" ]

}

@test "invoking without valid arguments prints usage" {
  run ${CUT} 2 1 0
  [ "$status" -eq 1 ]
  [ "${lines[0]}" = "${USAGE}" ]

}

@test "invoking with valid arguments is successful" {
  run $CUT 2 2 2
  [ "$status" -eq 0 ]

}
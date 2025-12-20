#!/usr/bin/env bash

bats_require_minimum_version 1.5.0

@test "microwave" {
	run --separate-stderr /app/main.sh

	[[ "$status" -eq 1 ]]
	[[ -z "$output" ]]
	[[ -z "$stderr" ]]
}

@test "microwave ''" {
	run --separate-stderr ./main.sh ''

	[[ "$status" -eq 2 ]]
	[[ -z "$output" ]]
	[[ -z "$stderr" ]]
}

@test "microwave 'x'" {
	run --separate-stderr ./main.sh 'x'

	[[ "$status" -eq 2 ]]
	[[ -z "$output" ]]
	[[ -z "$stderr" ]]
}

@test "microwave 'xxxxx'" {
	run --separate-stderr ./main.sh 'xxxxx'

	[[ "$status" -eq 2 ]]
	[[ -z "$output" ]]
	[[ -z "$stderr" ]]
}

@test "microwave '00000'" {
	run --separate-stderr ./main.sh '00000'

	[[ "$status" -eq 2 ]]
	[[ -z "$output" ]]
	[[ -z "$stderr" ]]
}

@test "microwave '0'" {
	run --separate-stderr ./main.sh '0'

	[[ "$status" -eq 0 ]]
	[[ "$output" == "00:00" ]]
	[[ -z "$stderr" ]]
}

@test "microwave '1'" {
	run --separate-stderr ./main.sh '1'

	[[ "$status" -eq 0 ]]
	[[ "$output" == "00:01" ]]
	[[ -z "$stderr" ]]
}

@test "microwave '59'" {
	run --separate-stderr ./main.sh '59'

	[[ "$status" -eq 0 ]]
	[[ "$output" == "00:59" ]]
	[[ -z "$stderr" ]]
}

@test "microwave '60'" {
	run --separate-stderr ./main.sh '60'

	[[ "$status" -eq 0 ]]
	[[ "$output" == "01:00" ]]
	[[ -z "$stderr" ]]
}

@test "microwave '61'" {
	run --separate-stderr ./main.sh '61'

	[[ "$status" -eq 0 ]]
	[[ "$output" == "01:01" ]]
	[[ -z "$stderr" ]]
}

@test "microwave '90'" {
	run --separate-stderr ./main.sh '90'

	[[ "$status" -eq 0 ]]
	[[ "$output" == "01:30" ]]
	[[ -z "$stderr" ]]
}

@test "microwave '99'" {
	run --separate-stderr ./main.sh '99'

	[[ "$status" -eq 0 ]]
	[[ "$output" == "01:39" ]]
	[[ -z "$stderr" ]]
}

@test "microwave '100'" {
	run --separate-stderr ./main.sh '100'

	[[ "$status" -eq 0 ]]
	[[ "$output" == "01:00" ]]
	[[ -z "$stderr" ]]
}

@test "microwave '101'" {
	run --separate-stderr ./main.sh '101'

	[[ "$status" -eq 0 ]]
	[[ "$output" == "01:01" ]]
	[[ -z "$stderr" ]]
}

@test "microwave '159'" {
	run --separate-stderr ./main.sh '159'

	[[ "$status" -eq 0 ]]
	[[ "$output" == "01:59" ]]
	[[ -z "$stderr" ]]
}

@test "microwave '160'" {
	run --separate-stderr ./main.sh '160'

	[[ "$status" -eq 0 ]]
	[[ "$output" == "02:00" ]]
	[[ -z "$stderr" ]]
}

@test "microwave '161'" {
	run --separate-stderr ./main.sh '161'

	[[ "$status" -eq 0 ]]
	[[ "$output" == "02:01" ]]
	[[ -z "$stderr" ]]
}

@test "microwave '199'" {
	run --separate-stderr ./main.sh '199'

	[[ "$status" -eq 0 ]]
	[[ "$output" == "02:39" ]]
	[[ -z "$stderr" ]]
}

@test "microwave '200'" {
	run --separate-stderr ./main.sh '200'

	[[ "$status" -eq 0 ]]
	[[ "$output" == "02:00" ]]
	[[ -z "$stderr" ]]
}

@test "microwave '201'" {
	run --separate-stderr ./main.sh '201'

	[[ "$status" -eq 0 ]]
	[[ "$output" == "02:01" ]]
	[[ -z "$stderr" ]]
}

@test "microwave '959'" {
	run --separate-stderr ./main.sh '959'

	[[ "$status" -eq 0 ]]
	[[ "$output" == "09:59" ]]
	[[ -z "$stderr" ]]
}

@test "microwave '960'" {
	run --separate-stderr ./main.sh '960'

	[[ "$status" -eq 0 ]]
	[[ "$output" == "10:00" ]]
	[[ -z "$stderr" ]]
}

@test "microwave '961'" {
	run --separate-stderr ./main.sh '961'

	[[ "$status" -eq 0 ]]
	[[ "$output" == "10:00" ]]
	[[ -z "$stderr" ]]
}

@test "microwave '1000'" {
	run --separate-stderr ./main.sh '1000'

	[[ "$status" -eq 0 ]]
	[[ "$output" == "10:00" ]]
	[[ -z "$stderr" ]]
}

@test "microwave '1001'" {
	run --separate-stderr ./main.sh '1001'

	[[ "$status" -eq 0 ]]
	[[ "$output" == "10:01" ]]
	[[ -z "$stderr" ]]
}

@test "microwave '9959'" {
	run --separate-stderr ./main.sh '9959'

	[[ "$status" -eq 0 ]]
	[[ "$output" == "99:59" ]]
	[[ -z "$stderr" ]]
}

@test "microwave '9960'" {
	run --separate-stderr ./main.sh '9960'

	[[ "$status" -eq 0 ]]
	[[ "$output" == "99:60" ]]
	[[ -z "$stderr" ]]
}

@test "microwave '9961'" {
	run --separate-stderr ./main.sh '9961'

	[[ "$status" -eq 0 ]]
	[[ "$output" == "99:61" ]]
	[[ -z "$stderr" ]]
}

@test "microwave '9999'" {
	run --separate-stderr ./main.sh '9999'

	[[ "$status" -eq 0 ]]
	[[ "$output" == "99:99" ]]
	[[ -z "$stderr" ]]
}

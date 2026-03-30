#!/usr/bin/env bash

declare sonic_pi='sonic-pi'
declare sonic_pi_cli='sonic_pi'
declare -i sonic_pi_pid

"$sonic_pi" &
sonic_pi_pid=$!
#"$sonic_pi" eval-file 'program.rb'
"$sonic_pi_cli" < 'program.rb'
kill -9 "$sonic_pi_pid"
stat -c '%n %s' ~/SonicPi/recording-*.wav

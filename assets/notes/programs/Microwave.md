# Program

* Program name: `microwave`

## Description

This program converts a string, as may be typed into a simple microwave, into `MM:SS` format, with a trailing newline.

The input must be passed as a single positional argument to the program. Any other usage is a usage error.

A usage error should produce no output, and exit with status `1`.

An invalid argument should produce no output, and exit with status `2`.

Correct behavior is based on the _Whirlpool WMH31017HZ-2_ (my kitchen microwave). This is a common kitchen microwave that is customarily installed above a range/stove. I have observed that other microwaves have varying behavior for strange inputs, such as `161` or `9999`. I chose this microwave as my source of truth merely because I have easy access to it.

Do not run a microwave without something in it to absorb the magnetron's radiation, or your microwave may damage itself. I used a large bowl of water to test behavior for inputs such as `9999`.

**Valid input examples**

Combinations of inputs and expected outputs are in the table below. Exit status should be `0`.

|                  |                 |                  |                  |
| ---------------: | --------------: | ---------------: | ---------------: |
| `0000` → `00:00` |  `60` → `01:00` |  `960` → `10:00` | `9959` → `99:59` |
|  `000` → `00:00` |  `61` → `01:01` |  `961` → `10:01` | `9960` → `99:60` |
|   `00` → `00:00` |  `90` → `01:30` |  `999` → `10:39` | `9961` → `99:61` |
|    `0` → `00:00` |  `99` → `01:39` | `1000` → `10:00` | `9999` → `99:99` |
|    `1` → `00:01` | `100` → `01:00` | `1001` → `10:01` |                  |
|   `59` → `00:59` | `101` → `01:01` |                  |                  |
|                  | `159` → `01:59` |                  |                  |
|                  | `160` → `02:00` |                  |                  |
|                  | `161` → `02:01` |                  |                  |
|                  | `199` → `02:39` |                  |                  |
|                  | `200` → `02:00` |                  |                  |
|                  | `201` → `02:01` |                  |                  |
|                  | `959` → `09:59` |                  |                  |

**Invalid input examples**

These should produce no output, and exit with status `2`.

* _Empty string_
* `x`
* `xxxx`
* `-1`
* `12345`

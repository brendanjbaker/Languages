# Plankalkül

Plankalkül cannot express output directly -- inputs are placed into register(s) (`V0`, `V1`, `V2`, ...), and outputs are left in register(s) (`R0`, `R1`, `R2`, ...).

Simple python wrapper scripts arrange the input register(s), run the Plankalkül interpreter, and parse/print the output register(s).

For the `hello` program, output in register #0 (`R0`) is an array of integers representing the ASCII codes of `Hello, world!`. Python converts this to a string, and prints it. (Of course, ASCII did not exist at the time.)

For the `sum` program, the _"range from"_ value `0` is placed into input register `V0`, and the _"range to"_ value `100` is placed into input register `V1`. Plankalkül calculates the sum of 0-100, which should be `5050`, and places it into output register `R0`, which the Python wrapper script extracts and prints.

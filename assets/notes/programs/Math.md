# Program

* Program name: `math`

## Description

_This is an upcoming program; no languages have been implemented yet._

_The list of calculations below is a work-in-progress. I intend to refine this list, and to add more._

This program prints a series of calculations. Each calculated result is trailed by a newline (`\n`). These are the calculations:

* `100 + 100 = 200` (uint8 + uint8 = uint8)
* `100 + 200 = 300` (uint8 + uint8 = uint16)
* `100 + 300 = 400` (uint8 + uint16 = uint16)
* `300 + 300 = 600` (uint16 + uint16 = uint16)
* `50_000 + 50_000 = 100_000` (uint16 + uint16 = uint32)
* `50_000 + 50_000_000 = 50_050_000` (uint16 + uint32 = uint32)

* `-100 - 100 = -200` (sint8 + sint8 = sint8)
* `-100 - 200 = -300` (sint8 + sint8 = sint16)
* `-100 - 300 = -400` (sint8 + sint16 = sint16)
* `-300 - 300 = -600` (sint16 + sint16 = sint16)
* `-10_000 - 30_000 = -40_000` (sint16 + sint16 = sint32)
* `-10_000 - 30_000_000 = -30_010_000` (sint16 + sint32 = sint32)

* `Fibonacci(10)` = uint8
* `Fibonacci(20)` = uint16
* `Fibonacci(30)` = uint32
* `Factorial(5)` = uint8
* `Factorial(7)` = uint16
* `Factorial(9)` = uint32

* `Min(uint8, uint8)` = uint8
* `Min(uint16, uint16)` = uint16
* `Min(uint32, uint32)` = uint32
* `Max(-10, -20)` = uint8
* `Max(-10_000, -20_000)` = uint16
* `Max(-100_000_000, -200_000_000)` = uint32

* `1 / 1 = 1`
* `1 / 2 = 0`
* `1.0 / 0.5 = 2`
* `1.0 / 1 = 1`
* `1.0 / 2 = 0.5`

If the program cannot compute the result, it should print `?`, and the test will be ignored. Any other (incorrect) result is a failure.

# Readme

## Summary

This repository contains examples of numerous different programming languages.

### Important note

The main runner program currently relies on my personal Bash library, e.g. the line of code near the beginning of `languages.sh` that says `source library`. The runner will not work out-of-the-box without it. In the very near future, I will refine a subset of my personal library for publication on GitHub, perhaps under a different name. At that time, I will update this repository accordingly, and remove this note.

With all of that being said, you could theoretically implement the missing functions called by `languages.sh`. None are too complex, and their purposes are hopefully obvious based on their names.

## Technical

Podman is used to build and execute a multi-layer image.

| Layer | Name       | Description                                                  |
| ----- | ---------- | ------------------------------------------------------------ |
| 1     | `base`     | Debian 13 (Trixie), Systemd, Snap, common apt packages.      |
| 2     | `system`   | Things shared between all languages (entry point, tests...). |
| 3     | `language` | Things shared within a language (language-specific setup...) |
| 4     | `program`  | The specific program for the language.                       |

This provides the following (for example):

* Changing a unit test (`system` layer) does not require re-installing apt packages (`base` layer).
* Changing a language setup script (`language` layer) does not require rebuilding the `base` or `system` layers.
* Changing a program does not require rebuilding any other layer (`base`, `system`, or `language`).

## Help

```
$ ./languages.sh --help
languages.sh 0.0.0.0

Usage:
  languages.sh [options] <command>

Options:
  --debug           Debug everything.
  --debug-docker    Debug docker building, etc.
  --debug-program   Debug program execution.
  --debug-setup     Debug language setup script.
  --help            Show this help message.
  --interactive     Begin an interaction session.
  --prime           Pre-generates image(s) without running them.
  --test            Run unit tests.
  --version         Show version information.

Commands:
  clean                      Remove stored images and containers.
  list                       List languages and their programs.
  run                        Run all languages and programs.
  run <LANGUAGE>             Run all programs for a language.
  run <LANGUAGE> <PROGRAM>   Run a specific language's program.
```

## Example usages

* List available languages and programs:
  * `languages.sh list`
* Run everything:
  * `languages.sh run`
* Run all C# programs:
  * `languages.sh run csharp`
* Run the C# _hello-world_ program:
  * `languages.sh run csharp hello-world`
* Debug the C# _hello-world_ program:
  * `languages.sh --debug run csharp hello-world`
* Enter interactive mode for C#, with the _hello-world_ program loaded:
  * `languages.sh --interactive csharp hello-world`
* Run tests for Rust (all programs):
  * `languages.sh --test run rust`
* Help/usage:
  * `languages.sh --help`
* Version:
  * `languages.sh --version`

## Programs

### `hello-world`

This program should print `Hello, world!`, with a trailing newline, and exit with status `0`.

### `sum`

This program should print the sum of 1-100 (inclusive), which is `5050`, with a trailing newline, and exit with status `0`.

### `microwave`

This program converts a string, as may be typed into a simple microwave, into `MM:SS` format, with a trailing newline.

The input must be passed as a single positional argument to the program. Any other usage is an error.

A usage error should exit with status `1`. An invalid argument should exit with status `2`.

Correct behavior is based on the _Whirlpool WMH31017HZ-2_ (my kitchen microwave). This is a common kitchen microwave that is customarily installed above a range/stove. I have observed that other microwaves have varying behavior for strange inputs, such as `161` or `9999`. I chose this microwave as my source of truth merely because I have easy access to it.

Do not run a microwave without something in it to absorb the magnetron's radiation, or your microwave may damage itself. I used a large bowl of water to test behavior for inputs such as `9999` (and shut it off when it reached `98:59`).

#### Valid input examples

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

#### Invalid input examples

* (Empty string)
* `x`
* `xxxx`
* `-1`
* `12345`

## Languages

| Language          | `hello-world` | `sum` | `microwave` |
| ----------------- | :-----------: | :---: | :---------: |
| Ada               |       ⬜       |   ⬜   |      ⬜      |
| Algol             |       ⬜       |   ⬜   |      ⬜      |
| APL               |       ⬜       |   ⬜   |      ⬜      |
| Arturo            |       ⬜       |   ⬜   |      ⬜      |
| Assembly          |       ✅       |   ⬜   |      ⬜      |
| Awk               |       ✅       |   ⬜   |      ⬜      |
| B                 |       ⬜       |   ⬜   |      ⬜      |
| Ballerina         |       ⬜       |   ⬜   |      ⬜      |
| Bash              |       ✅       |   ✅   |      ✅      |
| BASIC             |       ✅       |   ⬜   |      ⬜      |
| Batch             |       ⬜       |   ⬜   |      ⬜      |
| BCPL              |       ⬜       |   ⬜   |      ⬜      |
| Beef              |       ⬜       |   ⬜   |      ⬜      |
| Brainf#ck         |       ⬜       |   ⬜   |      ⬜      |
| C                 |       ✅       |   ✅   |      ✅      |
| C2                |       ⬜       |   ⬜   |      ⬜      |
| C3                |       ✅       |   ⬜   |      ⬜      |
| C#                |       ✅       |   ✅   |      ✅      |
| C++               |       ✅       |   ✅   |      ✅      |
| Carbon            |       ⬜       |   ⬜   |      ⬜      |
| Chapel            |       ✅       |   ✅   |      ✅      |
| Clojure           |       ⬜       |   ⬜   |      ⬜      |
| CLU               |       ⬜       |   ⬜   |      ⬜      |
| COBOL             |       ✅       |   ⬜   |      ⬜      |
| Cobra             |       ⬜       |   ⬜   |      ⬜      |
| CoffeeScript      |       ⬜       |   ⬜   |      ⬜      |
| ColdFusion        |       ⬜       |   ⬜   |      ⬜      |
| Cowgol            |       ⬜       |   ⬜   |      ⬜      |
| Crystal           |       ⬜       |   ⬜   |      ⬜      |
| D                 |       ✅       |   ✅   |      ✅      |
| Dart              |       ⬜       |   ⬜   |      ⬜      |
| dBase             |       ⬜       |   ⬜   |      ⬜      |
| Delphi            |       ⬜       |   ⬜   |      ⬜      |
| E                 |       ⬜       |   ⬜   |      ⬜      |
| Eiffel            |       ⬜       |   ⬜   |      ⬜      |
| Elixir            |       ⬜       |   ⬜   |      ⬜      |
| Elm               |       ⬜       |   ⬜   |      ⬜      |
| Erlang            |       ✅       |   ✅   |      ⬜      |
| F#                |       ✅       |   ⬜   |      ⬜      |
| Factor            |       ⬜       |   ⬜   |      ⬜      |
| Forth             |       ✅       |   ⬜   |      ⬜      |
| Fortran           |       ⬜       |   ⬜   |      ⬜      |
| Gleam             |       ⬜       |   ⬜   |      ⬜      |
| Glim              |       ⬜       |   ⬜   |      ⬜      |
| Go                |       ✅️       |   ⬜   |      ⬜      |
| Groovy            |       ⬜       |   ⬜   |      ⬜      |
| Hack              |       ⬜       |   ⬜   |      ⬜      |
| Hare              |       ⬜       |   ⬜   |      ⬜      |
| Haskell           |       ✅       |   ⬜   |      ⬜      |
| Hopper            |       ⬜       |   ⬜   |      ⬜      |
| HTML              |       ✅       |   ⬜   |      ⬜      |
| Icon              |       ⬜       |   ⬜   |      ⬜      |
| Io                |       ⬜       |   ⬜   |      ⬜      |
| Irdis             |       ⬜       |   ⬜   |      ⬜      |
| Java              |       ✅       |   ✅   |      ✅      |
| JavaScript        |       ✅       |   ✅   |      ✅      |
| Joule             |       ⬜       |   ⬜   |      ⬜      |
| Julia             |       ⬜       |   ⬜   |      ⬜      |
| Koka              |       ⬜       |   ⬜   |      ⬜      |
| Kotlin            |       ✅       |   ⬜   |      ⬜      |
| Lily              |       ⬜       |   ⬜   |      ⬜      |
| Lisp              |       ✅       |   ⬜   |      ⬜      |
| Lobster           |       ⬜       |   ⬜   |      ⬜      |
| Logo              |       ⬜       |   ⬜   |      ⬜      |
| Lua               |       ✅       |   ⬜   |      ⬜      |
| Maple             |       ⬜       |   ⬜   |      ⬜      |
| MATLAB            |       ✅       |   ⬜   |      ⬜      |
| Maxima            |       ⬜       |   ⬜   |      ⬜      |
| Modelica          |       ⬜       |   ⬜   |      ⬜      |
| Modula            |       ⬜       |   ⬜   |      ⬜      |
| Modula-2          |       ⬜       |   ⬜   |      ⬜      |
| Modula-3          |       ⬜       |   ⬜   |      ⬜      |
| Mojo              |       ⬜       |   ⬜   |      ⬜      |
| Nemerle           |       ⬜       |   ⬜   |      ⬜      |
| Never             |       ⬜       |   ⬜   |      ⬜      |
| Newspeak          |       ⬜       |   ⬜   |      ⬜      |
| Nim               |       ⬜       |   ⬜   |      ⬜      |
| Nit               |       ⬜       |   ⬜   |      ⬜      |
| Oberon            |       ⬜       |   ⬜   |      ⬜      |
| Object Pascal     |       ⬜       |   ⬜   |      ⬜      |
| Objective-C       |       ⬜       |   ⬜   |      ⬜      |
| Oblique           |       ⬜       |   ⬜   |      ⬜      |
| OCaml             |       ⬜       |   ⬜   |      ⬜      |
| Opa               |       ⬜       |   ⬜   |      ⬜      |
| Pascal            |       ✅       |   ⬜   |      ⬜      |
| Perl              |       ✅       |   ⬜   |      ⬜      |
| Phix              |       ⬜       |   ⬜   |      ⬜      |
| PHL               |       ⬜       |   ⬜   |      ⬜      |
| PHP               |       ✅       |   ✅   |      ⬜      |
| Pike              |       ⬜       |   ⬜   |      ⬜      |
| Planner           |       ⬜       |   ⬜   |      ⬜      |
| PL/M              |       ⬜       |   ⬜   |      ⬜      |
| Pony              |       ✅       |   ⬜   |      ⬜      |
| POP-11            |       ⬜       |   ⬜   |      ⬜      |
| PowerShell        |       ⬜       |   ⬜   |      ⬜      |
| Project Verona    |       ⬜       |   ⬜   |      ⬜      |
| Prolog            |       ⬜       |   ⬜   |      ⬜      |
| Python            |       ✅       |   ✅   |      ⬜      |
| Pure              |       ⬜       |   ⬜   |      ⬜      |
| R                 |       ⬜       |   ⬜   |      ⬜      |
| Racket            |       ⬜       |   ⬜   |      ⬜      |
| Rebol             |       ⬜       |   ⬜   |      ⬜      |
| Red               |       ⬜       |   ⬜   |      ⬜      |
| Rexx              |       ⬜       |   ⬜   |      ⬜      |
| Ring              |       ⬜       |   ⬜   |      ⬜      |
| Roc               |       ⬜       |   ⬜   |      ⬜      |
| RPG IV (RPGLE)    |       ⬜       |   ⬜   |      ⬜      |
| Ruby              |       ✅       |   ✅   |      ⬜      |
| RPL               |       ⬜       |   ⬜   |      ⬜      |
| Rust              |       ✅       |   ✅   |      ✅      |
| Scala             |       ✅       |   ⬜   |      ⬜      |
| Scheme            |       ✅       |   ⬜   |      ⬜      |
| Sed               |       ✅       |   ⬜   |      ⬜      |
| Seed7             |       ⬜       |   ⬜   |      ⬜      |
| Self              |       ⬜       |   ⬜   |      ⬜      |
| Simula            |       ⬜       |   ⬜   |      ⬜      |
| Smalltalk         |       ✅       |   ⬜   |      ⬜      |
| Solidity          |       ⬜       |   ⬜   |      ⬜      |
| SPARK             |       ⬜       |   ⬜   |      ⬜      |
| Spin (Parallax)   |       ⬜       |   ⬜   |      ⬜      |
| SQL               |       ✅       |   ✅   |      ✅      |
| Squeak            |       ⬜       |   ⬜   |      ⬜      |
| Squirrel          |       ⬜       |   ⬜   |      ⬜      |
| Standard ML       |       ⬜       |   ⬜   |      ⬜      |
| STRIPS            |       ⬜       |   ⬜   |      ⬜      |
| Swift             |       ⬜       |   ⬜   |      ⬜      |
| Tcl               |       ✅       |   ⬜   |      ⬜      |
| Tern              |       ⬜       |   ⬜   |      ⬜      |
| Toi               |       ⬜       |   ⬜   |      ⬜      |
| Typescript        |       ✅       |   ✅   |      ⬜      |
| Unicon            |       ⬜       |   ⬜   |      ⬜      |
| V                 |       ⬜       |   ⬜   |      ⬜      |
| Vala              |       ⬜       |   ⬜   |      ⬜      |
| Vale              |       ⬜       |   ⬜   |      ⬜      |
| VBScript          |       ⬜       |   ⬜   |      ⬜      |
| Verilog           |       ⬜       |   ⬜   |      ⬜      |
| VHDL              |       ⬜       |   ⬜   |      ⬜      |
| Visual Basic .NET |       ✅       |   ⬜   |      ⬜      |
| Visual Basic (6)  |       ⬜       |   ⬜   |      ⬜      |
| Visual FoxPro     |       ⬜       |   ⬜   |      ⬜      |
| Whiley            |       ⬜       |   ⬜   |      ⬜      |
| Wolfram           |       ⬜       |   ⬜   |      ⬜      |
| Wren              |       ⬜       |   ⬜   |      ⬜      |
| X10               |       ✅       |   ⬜   |      ⬜      |
| Xojo              |       ⬜       |   ⬜   |      ⬜      |
| Xtend             |       ⬜       |   ⬜   |      ⬜      |
| Zig               |       ✅       |   ✅   |      ✅      |
| _Count..._        |     _40_      |  _16_  |     _11_     |

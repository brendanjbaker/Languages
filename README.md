# Readme

## Summary

This repository contains examples of numerous different programming languages.

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
  --prime           Pre-generates image(s) without running them.
  --help            Show this help message.
  --interactive     Begin an interaction session.
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
* Help/usage:
  * `languages.sh --help`
* Version:
  * `languages.sh --version`

## Programs

### `hello-world`

This program should print `Hello, world!`.

### `sum`

This program should print the sum of 1-100 (inclusive), which is `5050`.

### `microwave`

This program converts a string, as may be typed into a simple microwave, into `HH:MM` format.

Correct behavior is based on the Whirlpool WMH31017HZ-2 (my kitchen microwave).

#### Valid inputs

* `0000` -> `00:00`
* `000` -> `00:00`
* `00` -> `00:00`
* `0` -> `00:00`
* `1` -> `00:01`
* `59` -> `00:59`
* `60` -> `01:00`
* `61` -> `01:01`
* `90` -> `01:30`
* `99` -> `01:39`
* `100` -> `01:00`
* `101` -> `01:01`
* `159` -> `01:59`
* `160` -> `02:00`
* `161` -> `02:01`
* `200` -> `02:00`
* `9999` -> `99:99`

#### Invalid inputs

* (Empty string)
* `X`
* `XXXX`
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
| Bash              |       ✅       |   ⬜   |      ⬜      |
| BASIC             |       ✅       |   ⬜   |      ⬜      |
| Batch             |       ⬜       |   ⬜   |      ⬜      |
| BCPL              |       ⬜       |   ⬜   |      ⬜      |
| Beef              |       ⬜       |   ⬜   |      ⬜      |
| Brainf#ck         |       ⬜       |   ⬜   |      ⬜      |
| C                 |       ✅       |   ⬜   |      ⬜      |
| C2                |       ⬜       |   ⬜   |      ⬜      |
| C3                |       ⬜       |   ⬜   |      ⬜      |
| C#                |       ✅       |   ⬜   |      ⬜      |
| C++               |       ✅       |   ⬜   |      ⬜      |
| Carbon            |       ⬜       |   ⬜   |      ⬜      |
| Clojure           |       ⬜       |   ⬜   |      ⬜      |
| CLU               |       ⬜       |   ⬜   |      ⬜      |
| COBOL             |       ✅       |   ⬜   |      ⬜      |
| Cobra             |       ⬜       |   ⬜   |      ⬜      |
| CoffeeScript      |       ⬜       |   ⬜   |      ⬜      |
| ColdFusion        |       ⬜       |   ⬜   |      ⬜      |
| Cowgol            |       ⬜       |   ⬜   |      ⬜      |
| Crystal           |       ⬜       |   ⬜   |      ⬜      |
| D                 |       ✅       |   ✅   |      ⬜      |
| Dart              |       ⬜       |   ⬜   |      ⬜      |
| dBase             |       ⬜       |   ⬜   |      ⬜      |
| Delphi            |       ⬜       |   ⬜   |      ⬜      |
| E                 |       ⬜       |   ⬜   |      ⬜      |
| Eiffel            |       ⬜       |   ⬜   |      ⬜      |
| Elixir            |       ⬜       |   ⬜   |      ⬜      |
| Elm               |       ⬜       |   ⬜   |      ⬜      |
| Erlang            |       ✅       |   ✅   |      ⬜      |
| F#                |       ⬜       |   ⬜   |      ⬜      |
| Factor            |       ⬜       |   ⬜   |      ⬜      |
| Forth             |       ⬜       |   ⬜   |      ⬜      |
| Fortran           |       ⬜       |   ⬜   |      ⬜      |
| Glim              |       ⬜       |   ⬜   |      ⬜      |
| Go                |       ✅️       |   ⬜   |      ⬜      |
| Groovy            |       ⬜       |   ⬜   |      ⬜      |
| Hack              |       ⬜       |   ⬜   |      ⬜      |
| Hare              |       ⬜       |   ⬜   |      ⬜      |
| Haskell           |       ⬜       |   ⬜   |      ⬜      |
| Hopper            |       ⬜       |   ⬜   |      ⬜      |
| Icon              |       ⬜       |   ⬜   |      ⬜      |
| Io                |       ⬜       |   ⬜   |      ⬜      |
| Irdis             |       ⬜       |   ⬜   |      ⬜      |
| Java              |       ✅       |   ⬜   |      ⬜      |
| JavaScript        |       ✅       |   ⬜   |      ⬜      |
| Joule             |       ⬜       |   ⬜   |      ⬜      |
| Julia             |       ⬜       |   ⬜   |      ⬜      |
| Koka              |       ⬜       |   ⬜   |      ⬜      |
| Kotlin            |       ⬜       |   ⬜   |      ⬜      |
| Lily              |       ⬜       |   ⬜   |      ⬜      |
| Lisp              |       ⬜       |   ⬜   |      ⬜      |
| Lobster           |       ⬜       |   ⬜   |      ⬜      |
| Logo              |       ⬜       |   ⬜   |      ⬜      |
| Lua               |       ⬜       |   ⬜   |      ⬜      |
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
| Pascal            |       ⬜       |   ⬜   |      ⬜      |
| Perl              |       ✅       |   ⬜   |      ⬜      |
| Phix              |       ⬜       |   ⬜   |      ⬜      |
| PHL               |       ⬜       |   ⬜   |      ⬜      |
| PHP               |       ✅       |   ✅   |      ⬜      |
| Pike              |       ⬜       |   ⬜   |      ⬜      |
| Planner           |       ⬜       |   ⬜   |      ⬜      |
| PL/M              |       ⬜       |   ⬜   |      ⬜      |
| Pony              |       ⬜       |   ⬜   |      ⬜      |
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
| Rust              |       ✅       |   ⬜   |      ⬜      |
| Scala             |       ⬜       |   ⬜   |      ⬜      |
| Scheme            |       ⬜       |   ⬜   |      ⬜      |
| Sed               |       ✅       |   ⬜   |      ⬜      |
| Seed7             |       ⬜       |   ⬜   |      ⬜      |
| Self              |       ⬜       |   ⬜   |      ⬜      |
| Simula            |       ⬜       |   ⬜   |      ⬜      |
| Smalltalk         |       ✅       |   ⬜   |      ⬜      |
| Solidity          |       ⬜       |   ⬜   |      ⬜      |
| SPARK             |       ⬜       |   ⬜   |      ⬜      |
| Spin (Parallax)   |       ⬜       |   ⬜   |      ⬜      |
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
| Visual Basic .NET |       ⬜       |   ⬜   |      ⬜      |
| Visual Basic (6)  |       ⬜       |   ⬜   |      ⬜      |
| Visual FoxPro     |       ⬜       |   ⬜   |      ⬜      |
| Whiley            |       ⬜       |   ⬜   |      ⬜      |
| Wolfram           |       ⬜       |   ⬜   |      ⬜      |
| Wren              |       ⬜       |   ⬜   |      ⬜      |
| X10               |       ⬜       |   ⬜   |      ⬜      |
| Xojo              |       ⬜       |   ⬜   |      ⬜      |
| Xtend             |       ⬜       |   ⬜   |      ⬜      |
| Zig               |       ✅       |   ⬜   |      ⬜      |
| _Count..._        |     _24_      |  _4_  |     _0_     |

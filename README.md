## Summary

This repository contains examples of 100+ programming languages.

Besides just showing example programs, the programs are runnable in a reproducible manner via Dockerfiles. Additionally, the programs are unit tested to ensure they indeed produce the expected output(s).

## Contents

- [Summary](#summary)
- [Contents](#contents)
- [Technical background](#technical-background)
- [Help](#help)
- [Usage examples](#usage-examples)
- [Programs](#programs)
	- [`hello`](#hello)
	- [`sum`](#sum)
	- [`microwave`](#microwave)
	- [`freestyle`](#freestyle)
- [Checklist](#checklist)
- [Cheating](#cheating)

## Technical background

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
  --debug             Debug everything.
  --debug-container   Debug container building, etc.
  --debug-program     Debug program execution.
  --debug-setup       Debug language setup script.
  --help              Show this help message.
  --interactive       Begin an interaction session.
  --parallel          Runs multiple programs concurrently.
  --prime             Pre-generates image(s) without running them.
  --reverse           Runs programs in reverse order.
  --test              Run unit tests.
  --version           Show version information.

Commands:
  clean                      Remove stored images and containers.
  list                       List languages and their programs.
  run                        Run all languages and programs.
  run <LANGUAGE>             Run all programs for a language.
  run <LANGUAGE> <PROGRAM>   Run a specific language's program.
```

## Usage examples

* List available languages and programs:
  * `./languages.sh list`
* Run everything:
  * `./languages.sh run`
* Run all C# programs:
  * `./languages.sh run csharp`
* Run the C# _hello_ program:
  * `./languages.sh run csharp hello`
* Debug the C# _hello_ program:
  * `./languages.sh --debug run csharp hello`
* Enter interactive mode for C#, with the _hello_ program loaded:
  * `./languages.sh --interactive csharp hello`
* Run tests for Rust (all programs):
  * `./languages.sh --test run rust`
* Help/usage:
  * `./languages.sh --help`
* Version:
  * `./languages.sh --version`

## Programs

### `hello`

This program should print `Hello, world!`, with a trailing newline, and exit with status `0`.

### `sum`

This program should print the sum of 1-100 (inclusive), which is `5050`, with a trailing newline, and exit with status `0`.

### `microwave`

This program converts a string, as may be typed into a simple microwave, into `MM:SS` format, with a trailing newline.

The input must be passed as a single positional argument to the program. Any other usage is an error.

A usage error should exit with status `1`. An invalid argument should exit with status `2`.

Correct behavior is based on the _Whirlpool WMH31017HZ-2_ (my kitchen microwave). This is a common kitchen microwave that is customarily installed above a range/stove. I have observed that other microwaves have varying behavior for strange inputs, such as `161` or `9999`. I chose this microwave as my source of truth merely because I have easy access to it.

Do not run a microwave without something in it to absorb the magnetron's radiation, or your microwave may damage itself. I used a large bowl of water to test behavior for inputs such as `9999`.

**Valid input examples**

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

* _Empty string_
* `x`
* `xxxx`
* `-1`
* `12345`

### `freestyle`

These programs are intended to demonstrate unique or interesting language features.

Test requirements are loose:

* There must be standard output (stdout).
* There must not be error output (stderr).
* Exit status must be 0.

## Checklist

| Language                         | `hello` | `sum` | `microwave` | `freestyle` |
| -------------------------------- | :-----: | :---: | :---------: | :---------: |
| Ada                              |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| Algol                            |    ✅️    |   ⬜   |      ⬜      |      ⬜      |
| APL                              |    ✅️    |   ✅️   |      ⬜      |      ⬜      |
| Arturo                           |    ✅    |   ✅   |      ⬜      |      ⬜      |
| Assembly                         |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| Awk                              |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| [B](src/b/README.md)             |    ✅    |   ✅   |      ⬜      |      ⬜      |
| B4X                              |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Ballerina                        |    ✅    |   ✅   |      ⬜      |      ⬜      |
| Bash                             |    ✅    |   ✅   |      ✅      |      ✅      |
| BASIC¹                           |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| Batch                            |    ✅    |   ✅   |      ⬜      |      ⬜      |
| BCPL                             |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Beanshell                        |    ✅    |   ✅   |      ⬜      |      ⬜      |
| Beef                             |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| Brainf#ck                        |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| C                                |    ✅    |   ✅   |      ✅      |      ⬜      |
| C#                               |    ✅    |   ✅   |      ✅      |      ⬜      |
| C++                              |    ✅    |   ✅   |      ✅      |      ⬜      |
| C2                               |    ✅    |   ✅   |      ⬜      |      ⬜      |
| C3                               |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| Caml                             |    ✅    |   ✅   |      ⬜      |      ⬜      |
| Carbon                           |    ✅    |   ✅   |      ⬜      |      ⬜      |
| Chapel                           |    ✅    |   ✅   |      ✅      |      ⬜      |
| Clojure                          |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| CLU                              |    ✅    |   ✅   |      ⬜      |      ⬜      |
| COBOL                            |    ✅    |   ✅   |      ⬜      |      ⬜      |
| Cobra                            |    ✅    |   ✅   |      ⬜      |      ⬜      |
| CoffeeScript                     |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| ColdFusion                       |    ✅    |   ✅   |      ⬜      |      ⬜      |
| Cowgol                           |    ✅    |   ✅   |      ⬜      |      ⬜      |
| Crystal                          |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| [CSS](src/css/README.md)¹        |    ✅    |   ✅   |      ⚠️      |      ⚠️      |
| D                                |    ✅    |   ✅   |      ✅      |      ⬜      |
| Dart                             |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| Daslang                          |    ✅    |   ✅   |      ⬜      |      ⬜      |
| dBase                            |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Delphi                           |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| E                                |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Eiffel                           |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| Elixir                           |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| Elm                              |    ✅    |   ✅   |      ⬜      |      ⬜      |
| Emacs Lisp                       |    ✅    |   ✅   |      ⬜      |      ⬜      |
| Erlang                           |    ✅    |   ✅   |      ⬜      |      ⬜      |
| F#                               |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| Factor                           |    ✅    |   ✅   |      ⬜      |      ⬜      |
| Forth                            |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| Fortran                          |    ✅    |   ✅   |      ⬜      |      ⬜      |
| FoxPro                           |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| [Futhark](src/futhark/README.md) |    ⚠️    |   ✅   |      ⬜      |      ⬜      |
| G-Portugol                       |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| Gambas                           |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| GAMS                             |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| GAP                              |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| GDScript                         |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Gleam                            |    ✅️    |   ✅️   |      ⬜      |      ⬜      |
| Glim                             |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Go                               |    ✅️    |   ⬜   |      ⬜      |      ⬜      |
| Groovy                           |    ✅️    |   ⬜   |      ⬜      |      ⬜      |
| Gurgle                           |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Hack                             |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| Hare                             |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| Haskell                          |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| Hax                              |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| Hopper                           |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| [HTML](src/html/README.md)¹      |    ✅    |   ⚠️   |      ⚠️      |      ⚠️      |
| HyperTalk                        |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Icon                             |    ✅    |   ✅   |      ⬜      |      ⬜      |
| Inform                           |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Ink                              |    ✅    |   ✅   |      ⬜      |      ⬜      |
| Io                               |    ✅    |   ✅   |      ⬜      |      ⬜      |
| Irdis                            |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Isabelle¹                        |    ✅    |   ✅   |      ⬜      |      ⬜      |
| J                                |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| J#                               |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Java                             |    ✅    |   ✅   |      ✅      |      ⬜      |
| JavaScript                       |    ✅    |   ✅   |      ✅      |      ⬜      |
| Joule                            |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| JS++                             |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| JScript                          |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Jtw                              |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Julia                            |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| Koka                             |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Kotlin                           |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| LabVIEW                          |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Ladder Logic                     |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Less¹                            |    ✅    |   ✅   |      ⬜      |      ⬜      |
| Lily                             |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Lisp                             |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| Lobster                          |    ✅    |   ✅   |      ⬜      |      ⬜      |
| Logo                             |    ✅    |   ✅   |      ⬜      |      ⬜      |
| Lua                              |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| Maple                            |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| MATLAB                           |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| Maxima                           |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Modelica                         |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Modula                           |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Modula-2                         |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| Modula-3                         |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Mojo                             |    ✅    |   ✅   |      ⬜      |      ⬜      |
| NATURAL                          |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Nemerle                          |    ⛔    |   ⬜   |      ⬜      |      ⬜      |
| Never                            |    ✅    |   ✅   |      ⬜      |      ⬜      |
| Newspeak                         |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Nim                              |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Nit                              |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Nix                              |    ✅    |   ✅   |      ⬜      |      ⬜      |
| NXT-G                            |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Oak                              |    ✅    |   ✅   |      ⬜      |      ⬜      |
| Oberon                           |    ✅    |   ✅   |      ⬜      |      ⬜      |
| Object Pascal                    |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| Objective-C                      |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| Oblique                          |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| OCaml                            |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| Odin                             |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Opa                              |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| OpenCL                           |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Pascal                           |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| Perl                             |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| Phix                             |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| PHL                              |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| PHP                              |    ✅    |   ✅   |      ⬜      |      ⬜      |
| Pike                             |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| PL/I                             |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| PL/M                             |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| PL/SQL                           |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Planner                          |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Pony                             |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| POP-11                           |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| PostScript                       |    ✅    |   ✅   |      ⬜      |      ⬜      |
| PowerShell                       |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| Project Verona                   |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Prolog                           |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| Pure                             |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Python                           |    ✅    |   ✅   |      ⬜      |      ⬜      |
| Q                                |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| R                                |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| Racket                           |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| Raku                             |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Rebol                            |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Red                              |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Rexx                             |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| Ring                             |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Roc                              |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| RPG IV (RPGLE)                   |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| RPL                              |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Ruby                             |    ✅    |   ✅   |      ⬜      |      ⬜      |
| Rust                             |    ✅    |   ✅   |      ✅      |      ⬜      |
| SAS                              |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Sass¹                            |    ✅    |   ✅   |      ⬜      |      ⬜      |
| Sather                           |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Scala                            |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| Scheme                           |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| Scratch                          |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Sed                              |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| Seed7                            |    ✅    |   ✅   |      ⬜      |      ⬜      |
| Self                             |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Simula                           |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| Smalltalk                        |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| Solidity                         |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| SPARK                            |    ✅    |   ✅   |      ⬜      |      ⬜      |
| Spin (Parallax)                  |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| [SQL](src/sql/README.md)¹        |    ✅    |   ✅   |      ✅      |      ⬜      |
| Squeak                           |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Squirrel                         |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Standard ML                      |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Stata                            |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Storm                            |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| STRIPS                           |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Structured Text                  |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Swift                            |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| Tcl                              |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| Tern                             |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Toi                              |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Transact-SQL                     |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Typescript                       |    ✅    |   ✅   |      ⬜      |      ⬜      |
| Unicon                           |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| V                                |    ✅    |   ✅   |      ⬜      |      ⬜      |
| Vala                             |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| Vale                             |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| VBScript                         |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Verilog                          |    ✅    |   ✅   |      ⬜      |      ⬜      |
| VHDL                             |    ✅    |   ✅   |      ⬜      |      ⬜      |
| Visual Basic .NET                |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| Visual Basic (6)                 |    ⛔    |   ⬜   |      ⬜      |      ⬜      |
| Wenyan (文言)                    |    ✅    |   ⛔   |      ⬜      |      ⬜      |
| Whiley                           |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| [Wolfram](src/wolfram/README.md) |    ✅    |   ✅   |      ⬜      |      ⬜      |
| Wren                             |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| X10                              |    ✅    |   ⬜   |      ⬜      |      ⬜      |
| Xojo                             |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Xtend                            |    ⬜    |   ⬜   |      ⬜      |      ⬜      |
| Zig                              |    ✅    |   ✅   |      ✅      |      ⬜      |
| _Count..._                       |  _110_  | _57_  |    _11_     |     _1_     |

**Legend**

| Symbol | Meaning              |
| :----: | :------------------- |
|   ✅    | Completed            |
|   ⚠️    | Unimplementable      |
|   ⛔    | Failing              |
|   ⬜    | Unimplemented        |
|   ¹    | "Cheating" required. |

## Cheating

Some programs require "cheating" to express output and/or pass tests.

See the [cheating](./notes/Cheating.md) page for additional information.

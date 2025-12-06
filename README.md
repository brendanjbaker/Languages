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
  * `./languages.sh run`
* Run all C# programs:
  * `languages.sh run csharp`
* Run the C# program:
  * `languages.sh run csharp hello-world`
* Debug the C# program:
  * `languages.sh --debug run csharp hello-world`
* Enter interactive mode for C#, with the program loaded:
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

## Languages

| Language          | `hello-world` | `sum` |
| ----------------- | :-----------: | :---: |
| Ada               |       ☐       |   ☐   |
| Algol             |       ☐       |   ☐   |
| APL               |       ☐       |   ☐   |
| Awk               |       🗹       |   ☐   |
| Assembly          |       🗹       |   ☐   |
| B                 |       ☐       |   ☐   |
| Bash              |       🗹       |   ☐   |
| BASIC             |       🗹       |   ☐   |
| Batch             |       ☐       |   ☐   |
| Brainf#ck         |       ☐       |   ☐   |
| C                 |       🗹       |   ☐   |
| C#                |       🗹       |   ☐   |
| C++               |       🗹       |   ☐   |
| Carbon            |       ☐       |   ☐   |
| Clojure           |       ☐       |   ☐   |
| COBOL             |       🗹       |   ☐   |
| CoffeeScript      |       ☐       |   ☐   |
| ColdFusion        |       ☐       |   ☐   |
| Crystal           |       ☐       |   ☐   |
| D                 |       🗹       |   🗹   |
| Dart              |       ☐       |   ☐   |
| dBase             |       ☐       |   ☐   |
| Delphi            |       ☐       |   ☐   |
| E                 |       ☐       |   ☐   |
| Eiffel            |       ☐       |   ☐   |
| Elixir            |       ☐       |   ☐   |
| Elm               |       ☐       |   ☐   |
| Erlang            |       🗹       |   ☐   |
| F#                |       ☐       |   ☐   |
| Factor            |       ☐       |   ☐   |
| Forth             |       ☐       |   ☐   |
| Fortran           |       ☐       |   ☐   |
| Glim              |       ☐       |   ☐   |
| Go                |       🗹       |   ☐   |
| Groovy            |       ☐       |   ☐   |
| Hack              |       ☐       |   ☐   |
| Haskell           |       ☐       |   ☐   |
| Icon              |       ☐       |   ☐   |
| Io                |       ☐       |   ☐   |
| Irdis             |       ☐       |   ☐   |
| Java              |       🗹       |   ☐   |
| JavaScript        |       🗹       |   ☐   |
| Joule             |       ☐       |   ☐   |
| Julia             |       ☐       |   ☐   |
| Kotlin            |       ☐       |   ☐   |
| Lisp              |       ☐       |   ☐   |
| Lua               |       ☐       |   ☐   |
| Maple             |       ☐       |   ☐   |
| MATLAB            |       🗹       |   ☐   |
| Maxima            |       ☐       |   ☐   |
| Modelica          |       ☐       |   ☐   |
| Modula            |       ☐       |   ☐   |
| Modula-2          |       ☐       |   ☐   |
| Modula-3          |       ☐       |   ☐   |
| NASM              |       ☐       |   ☐   |
| Nemerle           |       ☐       |   ☐   |
| Newspeak          |       ☐       |   ☐   |
| Nim               |       ☐       |   ☐   |
| Oberon            |       ☐       |   ☐   |
| Object Pascal     |       ☐       |   ☐   |
| Objective-C       |       ☐       |   ☐   |
| Oblique           |       ☐       |   ☐   |
| OCaml             |       ☐       |   ☐   |
| Octave            |       ☐       |   ☐   |
| Opa               |       ☐       |   ☐   |
| Pascal            |       ☐       |   ☐   |
| Perl              |       🗹       |   ☐   |
| PHP               |       🗹       |   ☐   |
| Planner           |       ☐       |   ☐   |
| POP-11            |       ☐       |   ☐   |
| PowerShell        |       ☐       |   ☐   |
| Project Verona    |       ☐       |   ☐   |
| Prolog            |       ☐       |   ☐   |
| Python            |       🗹       |   🗹   |
| QBASIC            |       ☐       |   ☐   |
| R                 |       ☐       |   ☐   |
| Rebol             |       ☐       |   ☐   |
| Red               |       ☐       |   ☐   |
| Ring              |       ☐       |   ☐   |
| RPG IV (RPGLE)    |       ☐       |   ☐   |
| Ruby              |       🗹       |   🗹   |
| Rust              |       🗹       |   ☐   |
| Scala             |       ☐       |   ☐   |
| Scheme            |       ☐       |   ☐   |
| Sed               |       🗹       |   ☐   |
| Seed7             |       ☐       |   ☐   |
| Self              |       ☐       |   ☐   |
| Simula            |       ☐       |   ☐   |
| Smalltalk         |       🗹       |   ☐   |
| Solidity          |       ☐       |   ☐   |
| SPARK             |       ☐       |   ☐   |
| Spin (Parallax)   |       ☐       |   ☐   |
| Squeak            |       ☐       |   ☐   |
| Squirrel          |       ☐       |   ☐   |
| Standard ML       |       ☐       |   ☐   |
| STRIPS            |       ☐       |   ☐   |
| Swift             |       ☐       |   ☐   |
| Tcl               |       🗹       |   ☐   |
| Toi               |       ☐       |   ☐   |
| Typescript        |       ☐       |   ☐   |
| Unicon            |       ☐       |   ☐   |
| V                 |       ☐       |   ☐   |
| Vala              |       ☐       |   ☐   |
| VBScript          |       ☐       |   ☐   |
| Visual Basic .NET |       ☐       |   ☐   |
| Visual Basic (6)  |       ☐       |   ☐   |
| Visual FoxPro     |       ☐       |   ☐   |
| WebAssembly       |       ☐       |   ☐   |
| Whiley            |       ☐       |   ☐   |
| Wolfram           |       ☐       |   ☐   |
| X10               |       ☐       |   ☐   |
| Xojo              |       ☐       |   ☐   |
| Xtend             |       ☐       |   ☐   |
| Zig               |       🗹       |   ☐   |

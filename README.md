## Summary

This repository contains examples of 100+ programming languages.

Besides just showing example programs, the programs are runnable in a reproducible manner via Dockerfiles. Additionally, the programs are tested to ensure they indeed produce the expected output(s).

## Screenshot

![Test mode screenshot.](assets/screenshots/test-mode.png)

## Contents

- [Summary](#summary)
- [Screenshot](#screenshot)
- [Contents](#contents)
- [Contributing](#contributing)
- [Technical background](#technical-background)
- [Help](#help)
- [Usage examples](#usage-examples)
- [Programs](#programs)
- [Checklist](#checklist)
- [Cheating](#cheating)

## Contributing

This project is for my personal development, so generally, pull requests aren't requested or desired.

If you'd like your language added, or would like some other change made, please [open an issue](https://github.com/brendanjbaker/Languages/issues/new).

Feel free to fork this repository and change things as you see fit!

## Technical background

Podman is used to build and execute a multi-layer image.

| Layer | Name       | Description                                                   |
| ----- | ---------- | ------------------------------------------------------------- |
| 1     | `base`     | Debian 13 (Trixie), common apt packages.                      |
| 2     | `system`   | Things shared between all languages (entry point, tests...).  |
| 3     | `language` | Things shared within a language (language-specific setup...). |
| 4     | `program`  | The specific program for the language.                        |

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
  --configure         Install needed dependencies, etc.
  --debug             Debug everything.
  --debug-container   Debug container building, etc.
  --debug-program     Debug program execution.
  --debug-setup       Debug language setup script.
  --help              Show this help message.
  --interactive       Begin an interaction session.
  --lean              Minimize retained images (reduces disk consumption).
  --parallel          Runs multiple programs concurrently.
  --prime             Pre-generates image(s) without running them.
  --random            Runs programs in random order.
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

| Name        | Description                    | Details                                      |
| ----------- | ------------------------------ | -------------------------------------------- |
| `hello`     | Toolchain test.                | [Link](./assets/notes/programs/Hello.md)     |
| `sum`       | Basic logic/control.           | [Link](./assets/notes/programs/Sum.md)       |
| `math`      | Computation suite.             | [Link](./assets/notes/programs/Math.md)      |
| `microwave` | Varied inputs/logic.           | [Link](./assets/notes/programs/Microwave.md) |
| `freestyle` | Show unique language features. | [Link](./assets/notes/programs/Freestyle.md) |

## Checklist

| 📁                           | Language                                  | `hello` | `sum` | `math` | `microwave` | `freestyle` |
| --------------------------- | ----------------------------------------- | :-----: | :---: | :----: | :---------: | :---------: |
| [📁](src/active-oberon)      | Active Oberon                             |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/ada)                | Ada                                       |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/admiran)            | Admiran                                   |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/agda)               | Agda                                      |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/algol.60)           | Algol (60)¹                               |    ✅️    |   ✅️   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/algol.68)           | Algol (68)                                |    ✅️    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/alumina)            | Alumina                                   |    ✅️    |   ✅️   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/angelscript)        | AngelScript                               |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/ante)               | Ante                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/apl)                | APL                                       |    ✅️    |   ✅️   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/ark)                | Ark                                       |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/arturo)             | Arturo                                    |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/asphalt)            | Asphalt                                   |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/assembly.gnu)       | Assembly (GNU)                            |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/assembly.microsoft) | Assembly (Microsoft)                      |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/assembly.netwide)   | Assembly (Netwide)                        |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/assemblyscript)     | AssemblyScript                            |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/atlas)              | Atlas Autocode                            |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/ats)                | ATS                                       |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/austral)            | Austral                                   |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/awk)                | Awk                                       |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/axum)               | Axum                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/b)                  | [B](src/b/README.md)                      |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/b4x)                | B4X                                       |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/ballerina)          | Ballerina                                 |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/bash)               | Bash                                      |    ✅    |   ✅   |   ⬜    |      ✅      |      ✅      |
| [📁](src/basic.amiga)        | BASIC (Amiga)                             |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/basic.bbc)          | BASIC (BBC)¹                              |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/basic.commodore)    | BASIC (Commodore)                         |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/basic.pure)         | BASIC (Pure)                              |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/basic.quickbasic)   | BASIC (QuickBASIC)¹                       |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/batch)              | Batch                                     |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/bau)                | Bau                                       |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/bcpl)               | BCPL                                      |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/beanshell)          | Beanshell                                 |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/beef)               | Beef                                      |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/bend)               | Bend                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/blazin-forth)       | Blazin' Forth                             |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/bliss)              | BLISS                                     |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/boron)              | Boron                                     |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/brainf_ck)          | Brainf#ck                                 |    ✅    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/c)                  | C                                         |    ✅    |   ✅   |   ⬜    |      ✅      |      ⬜      |
| [📁](src/c2)                 | C2                                        |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/c3)                 | C3                                        |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/cakelisp)           | Cakelisp                                  |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/cal)                | CAL                                       |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/caml)               | Caml                                      |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/carbon)             | Carbon                                    |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/carp)               | Carp                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/ceylon)             | Ceylon                                    |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/chapel)             | Chapel                                    |    ✅    |   ✅   |   ⬜    |      ✅      |      ⬜      |
| [📁](src/chuck)              | ChucK                                     |    ✅    |   ✅   |   ⬜    |      ⬜      |      ✅      |
| [📁](src/clean)              | Clean                                     |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/clojure)            | Clojure                                   |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/clu)                | CLU                                       |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/cmm)                | C--                                       |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/cms-2)              | CMS-2                                     |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/cobol.68)           | COBOL (68)                                |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/cobol.74)           | COBOL (74)                                |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/cobol.85)           | COBOL (85)                                |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/cobra)              | Cobra                                     |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/coffeescript)       | CoffeeScript                              |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/coldfusion)         | ColdFusion                                |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/component-pascal)   | Component Pascal                          |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/concrete)           | Concrete                                  |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/cone)               | Cone                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/control)            | Control Language                          |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/coral)              | Coral                                     |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/coral.66)           | CORAL (CORAL 66)                          |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/cowgol)             | Cowgol                                    |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/cpl)                | CPL                                       |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/cpp)                | C++                                       |    ✅    |   ✅   |   ⬜    |      ✅      |      ⬜      |
| [📁](src/crystal)            | Crystal                                   |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/csharp)             | C#                                        |    ✅    |   ✅   |   ⬜    |      ✅      |      ⬜      |
| [📁](src/csound)             | Csound                                    |    ✅    |   ✅   |   ⬜    |      ⬜      |      ✅      |
| [📁](src/css)                | [CSS](src/css/README.md)¹                 |    ✅    |   ✅   |   ⬜    |      ⚠️      |      ⬜      |
| [📁](src/cwerg)              | Cwerg                                     |    ✅    |   ✅   |   ⬜    |      ✅      |      ⬜      |
| [📁](src/cyber)              | [Cyber](src/cyber/README.md)              |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/cyclone)            | Cyclone                                   |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/d)                  | D                                         |    ✅    |   ✅   |   ⬜    |      ✅      |      ⬜      |
| [📁](src/dafny)              | Dafny                                     |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/dart)               | Dart                                      |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/daslang)            | Daslang                                   |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/dbase)              | dBase                                     |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/delphi)             | Delphi                                    |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/duck)               | Duck                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/dylan)              | Dylan                                     |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/e)                  | E                                         |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/ec)                 | eC                                        |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/edinburgh-imp)      | Edinburgh IMP                             |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/effekt)             | Effekt                                    |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/eiffel)             | Eiffel                                    |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/elixir)             | Elixir                                    |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/elk.a)              | [Elk](src/elk.a/README.md) (A)            |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/elk.b)              | [Elk](src/elk.b/README.md) (B)            |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/elm)                | Elm                                       |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/emacs-lisp)         | Emacs Lisp                                |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/erde)               | Erde                                      |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/erlang)             | Erlang                                    |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/euclid)             | Euclid                                    |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/exa)                | EXA (TEC Redshift)                        |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/extempore)          | Extempore                                 |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/factor)             | Factor                                    |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/fe)                 | fe                                        |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/fennel)             | Fennel                                    |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/fifth)              | Fifth                                     |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/fl)                 | FL                                        |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/flint)              | Flint                                     |    ✅    |   ✅   |   ⬜    |      ✅      |      ⬜      |
| [📁](src/flix)               | Flix                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/flow-matic)         | FLOW-MATIC¹                               |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/flux)               | Flux                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/focal)              | FOCAL                                     |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/forth)              | Forth                                     |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/fortran)            | Fortran                                   |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/foxpro)             | FoxPro                                    |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/fp)                 | FP                                        |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/freemarker)         | [FreeMarker](src/freemarker/README.md)    |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/fsharp)             | F#                                        |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/fstar)              | F*                                        |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/futhark)            | [Futhark](src/futhark/README.md)          |    ⚠️    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/g-portugol)         | G-Portugol                                |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/gambas)             | Gambas                                    |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/gams)               | GAMS                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/gap)                | GAP                                       |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/gdscript)           | GDScript                                  |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/gforth)             | Gforth                                    |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/gleam)              | Gleam                                     |    ✅️    |   ✅️   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/glim)               | Glim                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/go)                 | Go                                        |    ✅️    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/groovy)             | Groovy                                    |    ✅️    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/gurgle)             | Gurgle                                    |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/hack)               | Hack                                      |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/hal-s)              | HAL/S                                     |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/hare)               | Hare                                      |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/haskell)            | Haskell                                   |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/haxe)               | Haxe                                      |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/hazel)              | Hazel                                     |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/holyc)              | HolyC                                     |    ✅    |   ✅   |   ⬜    |      ✅      |      ⬜      |
| [📁](src/hope)               | Hope                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/hopper)             | Hopper                                    |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/html)               | [HTML](src/html/README.md)¹               |    ✅    |   ⚠️   |   ⚠️    |      ⚠️      |      ⬜      |
| [📁](src/hy)                 | Hy                                        |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/hylo)               | Hylo                                      |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/hypertalk)          | HyperTalk                                 |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/icon)               | Icon                                      |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/idris)              | Idris                                     |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/inform)             | Inform                                    |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/ink)                | Ink                                       |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/inko)               | Inko                                      |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/intercal)           | INTERCAL                                  |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/io)                 | Io                                        |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/isabelle)           | Isabelle¹                                 |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/j)                  | J                                         |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/janet)              | Janet                                     |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/jank)               | Jank                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/janus)              | Janus                                     |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/java)               | Java                                      |    ✅    |   ✅   |   ⬜    |      ✅      |      ⬜      |
| [📁](src/javascript)         | JavaScript                                |    ✅    |   ✅   |   ⬜    |      ✅      |      ⬜      |
| [📁](src/jinja2)             | [Jinja2](src/jinja2/README.md)            |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/joss)               | JOSS                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/joule)              | Joule                                     |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/jovial)             | JOVIAL                                    |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/joy)                | [Joy](src/joy/README.md)¹                 |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/jscript)            | JScript                                   |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/jsharp)             | J#                                        |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/jspp)               | JS++                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/jtw)                | Jtw                                       |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/jule)               | Jule                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/julia)              | Julia                                     |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/kairo)              | Kairo                                     |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/kip)                | Kip                                       |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/kit)                | Kit                                       |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/kitten)             | Kitten                                    |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/koka)               | Koka                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/kotlin)             | Kotlin                                    |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/krc)                | KRC                                       |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/labview)            | LabVIEW                                   |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/ladder-logic)       | Ladder Logic                              |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/language-84)        | Language 84                               |    ✅    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/ldpl)               | LDPL                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/lean)               | Lean                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/less)               | Less¹                                     |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/lil)                | Lil                                       |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/lily.a)             | [Lily](src/lily.a/README.md) (A)          |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/lily.b)             | [Lily](src/lily.b/README.md) (B)          |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/lisp)               | Lisp                                      |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/litac)              | LitaC                                     |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/llvm-ir)            | LLVM IR                                   |    ✅    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/lo)                 | LO                                        |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/lobster)            | Lobster                                   |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/logo)               | Logo                                      |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/lolcode)            | LOLCODE                                   |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/lua)                | Lua                                       |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/lucia)              | Lucia                                     |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/lucid)              | Lucid                                     |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/maolang)            | MaoLang                                   |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/maple)              | Maple                                     |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/matlab)             | MATLAB                                    |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/maxima)             | Maxima                                    |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/mesa)               | Mesa                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/metaocaml)          | MetaOCaml                                 |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/min)                | Min                                       |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/minilang)           | MiniLang                                  |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/miranda)            | Miranda                                   |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/modelica)           | Modelica                                  |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/modula-2)           | Modula-2                                  |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/modula-3)           | Modula-3                                  |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/modula)             | Modula                                    |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/mojo)               | Mojo                                      |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/moonscript)         | MoonScript                                |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/mouse-83)           | Mouse-83                                  |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/move)               | Move                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/mumps)              | MUMPS (M)                                 |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/myrddin)            | Myrddin                                   |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/napier88)           | Napier88                                  |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/natural)            | NATURAL                                   |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/nature)             | Nature                                    |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/neat)               | Neat                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/nelua)              | Nelua                                     |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/nemerle)            | Nemerle                                   |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/never)              | Never                                     |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/newspeak)           | Newspeak                                  |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/nial)               | Nial                                      |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/nim)                | Nim                                       |    ✅    |   ✅   |   ⬜    |      ✅      |      ⬜      |
| [📁](src/nit)                | Nit                                       |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/niva)               | Niva                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/nix)                | Nix                                       |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/nospace)            | Nospace                                   |    ✅    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/npl)                | NPL                                       |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/nsk)                | NSK                                       |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/nxt-g)              | NXT-G                                     |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/oak)                | Oak                                       |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/oberon)             | Oberon                                    |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/oberon-07)          | Oberon-07                                 |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/oberon-2)           | Oberon-2                                  |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/oberon-plus)        | Oberon+                                   |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/object-pascal)      | Object Pascal                             |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/objective-c)        | Objective-C                               |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/obliq)              | Obliq                                     |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/ocaml)              | OCaml                                     |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/ocen)               | Ocen                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/odin)               | Odin                                      |    ✅    |   ✅   |   ⬜    |      ✅      |      ⬜      |
| [📁](src/ok)                 | K (oK)                                    |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/oni)                | Oni                                       |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/opa)                | Opa                                       |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/opencl)             | OpenCL                                    |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/orwell)             | Orwell                                    |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/oxygene)            | Oxygene                                   |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/par)                | Par                                       |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/parasail)           | ParaSail                                  |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/pascal)             | Pascal                                    |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/pastel)             | Pastel                                    |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/perl)               | Perl                                      |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/phix)               | Phix                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/phl)                | PHL                                       |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/php)                | PHP                                       |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/pie)                | Pie                                       |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/piet)               | Piet                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/pike)               | Pike                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/pkl)                | Pkl                                       |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/pl-6)               | PL-6                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/pl-8)               | PL.8                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/pl-b)               | PL/B                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/pl-c)               | PL/C                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/pl-i)               | PL/I                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/pl-m)               | PL/M¹                                     |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/pl-s)               | PL/S                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/pl-sql)             | PL/SQL                                    |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/plankalkul)         | [Plankalkül](src/plankalkul/README.md)¹   |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/planner)            | Planner                                   |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/plasm)              | Plasm                                     |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/pony)               | Pony                                      |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/pop-11)             | POP-11                                    |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/postscript)         | PostScript                                |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/power-fx)           | Power Fx                                  |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/powershell)         | PowerShell                                |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/prescheme)          | PreScheme                                 |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/project-verona)     | Project Verona                            |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/prolog)             | Prolog                                    |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/ps-algol)           | PS-algol                                  |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/pure)               | Pure                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/purescript)         | PureScript                                |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/python)             | Python                                    |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/q)                  | Q                                         |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/qalb)               | قلب (Qalb)                                |    ✅    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/quackery)           | Quackery¹                                 |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/quetite)            | Quetite                                   |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/r)                  | R                                         |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/racket)             | Racket                                    |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/raku)               | Raku                                      |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/reason)             | Reason                                    |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/rebol)              | Rebol                                     |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/red)                | Red                                       |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/retroforth)         | RetroForth                                |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/rexx)               | Rexx                                      |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/ring)               | Ring                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/roc)                | Roc                                       |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/rocq)               | Rocq                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/rpg)                | RPG (IV)                                  |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/rpl)                | RPL                                       |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/rtl-2)              | RTL/2                                     |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/rtl)                | RTL                                       |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/ruby)               | Ruby                                      |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/rust)               | Rust                                      |    ✅    |   ✅   |   ⬜    |      ✅      |      ⬜      |
| [📁](src/rye)                | Rye                                       |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/s-algol)            | S-algol                                   |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/sas)                | SAS                                       |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/sasl)               | SASL                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/sass)               | Sass¹                                     |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/sather)             | Sather                                    |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/scala)              | Scala                                     |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/scheme)             | Scheme                                    |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/scopes)             | Scopes                                    |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/scratch)            | Scratch                                   |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/sectorlisp)         | SectorLISP                                |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/sed)                | Sed                                       |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/seed7)              | Seed7                                     |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/self)               | Self                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/shen)               | Shen                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/sic-1)              | SIC-1                                     |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/sieve)              | [Sieve](src/sieve/README.md)¹             |    ✅    |   ⚠️   |   ⚠️    |      ⚠️      |      ✅      |
| [📁](src/silk)               | Silk                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/simula)             | Simula                                    |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/smalljs)            | SmallJS                                   |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/smalltalk)          | Smalltalk                                 |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/solidity)           | Solidity                                  |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/sonic-pi)           | Sonic Pi                                  |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/spark)              | SPARK                                     |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/sparrow)            | Sparrow                                   |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/spin)               | Spin (Parallax)                           |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/sql)                | [SQL](src/sql/README.md)¹                 |    ✅    |   ✅   |   ⬜    |      ✅      |      ⬜      |
| [📁](src/squeak)             | Squeak                                    |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/squirrel)           | Squirrel                                  |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/standard-ml)        | [Standard ML](src/standard-ml/README.md)¹ |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/stata)              | Stata                                     |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/storm)              | Storm                                     |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/stringcomp)         | STRINGCOMP                                |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/structured-text)    | Structured Text                           |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/subleq)             | Subleq                                    |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ✅      |
| [📁](src/supercollider)      | SuperCollider                             |    ✅    |   ✅   |   ⬜    |      ⬜      |      ✅      |
| [📁](src/swift)              | Swift                                     |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/sympl)              | SYMPL                                     |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/t3x-0)              | T3X/0                                     |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/tailspin)           | Tailspin                                  |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/tampio)             | Tampio¹                                   |    ✅    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/tcl)                | Tcl                                       |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/teal)               | Teal                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/teascript)          | Teascript                                 |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/telcomp)            | TELCOMP                                   |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/tern)               | Tern                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/terra)              | Terra                                     |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/th1)                | TH1                                       |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/toi)                | Toi                                       |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/transact-sql)       | Transact-SQL                              |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/tric)               | TriC                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/typescript)         | Typescript                                |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/uiua)               | Uiua                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/unicon)             | Unicon                                    |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/unison)             | Unison                                    |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/uxntal)             | Uxntal                                    |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/v)                  | V                                         |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/vala)               | Vala                                      |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/vale)               | Vale                                      |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/varyx)              | Varyx                                     |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/vbscript)           | VBScript                                  |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/verilog)            | Verilog                                   |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/veryl)              | Veryl                                     |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/vhdl)               | VHDL                                      |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/visual-basic.6)     | Visual Basic (6)                          |    ⛔    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/visual-basic.net)   | Visual Basic (.NET)                       |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/vox)                | Vox                                       |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/vvvv)               | vvvv                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/wax)                | wax                                       |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/wenyan)             | 文言 (Wenyan)                             |    ✅    |   ⛔   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/whiley)             | Whiley                                    |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/whitespace)         | Whitespace                                |    ✅    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/wolfram)            | [Wolfram](src/wolfram/README.md)          |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/wren)               | Wren                                      |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/x10)                | X10                                       |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/xod)                | XOD                                       |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/xojo)               | [Xojo](src/xojo/README.md)                |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/xs)                 | XS                                        |    ✅    |   ✅   |   ⬜    |      ⬜      |      ✅      |
| [📁](src/xslt)               | XSLT                                      |    ⬜    |   ⬜   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/xtend)              | Xtend                                     |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/ylang)              | ylang                                     |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/ysh)                | YSH                                       |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/zen-c)              | Zen C                                     |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
| [📁](src/zig)                | Zig                                       |    ✅    |   ✅   |   ⬜    |      ✅      |      ⬜      |
| [📁](src/zonnon)             | Zonnon                                    |    ✅    |   ✅   |   ⬜    |      ⬜      |      ⬜      |
|                             | _Count..._                                |  _190_  | _181_ |  _0_   |    _16_     |     _6_     |

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

See the [cheating](./assets/notes/Cheating.md) page for additional information.

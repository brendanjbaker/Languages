# Technical Information

## File names

Programs are named `program.x`, where `x` is the language's customary extension.

_Examples:_

* C: `program.c`
* Perl: `program.pl`

**Capitalization**

If it is customary (or necessary) to capitalize the filename, then `Program` is used instead of `program`.

_Examples:_

* C#: `Program.cs`
* Java: `Program.java`

**Entry point**

In some languages, it is idiomatic for the main entrypoint to be defined in a file named `main.x`, or some other customary name that language uses. But for consistency, we will use the name format `program.x` anyway, and specify the entry point accordingly.

_Examples:_

* Roc: `program.roc` instead of `main.roc`
* HTML: `program.html` instead of `index.html`

## Module names

Where a module and/or class name is required to be defined, the name `program` is used.

**Capitalization**

If it is customary (or necessary) to capitalize the module/class name, then `Program` is used instead of `program`.

_Examples:_

* C#: `class Program`
* Java: `class Program`

**Reserved words**

If `program` or `Program` is a reserved word in the language, a name such as `_program` or `_Program` may be used instead.

_Examples:_

* Pascal: `program _Program;`
* Delphi: `program _Program;`
* Object Pascal: `program _Program;`

## Compilation vs. interpretation

If a language can be either compiled or interpreted, then compilation is performed wherever possible.

## Container setup

Where possible, `apt` is used to install either (A) official Debian packages, or (B) `.deb` file packages.

Otherwise, language-specific software will be installed in this location inside the container:

`/opt/<software-name>/<software-version>`

_Examples:_

* `/opt/ink/1.9`
* `/opt/lobster/2025.4`
* `/opt/v/0.5`

Where possible, official binaries are used. Otherwise, the required software is compiled from source.

**Snap packages**

Some languages, such as Zig, are not in Debian's `apt` package repository, but offer easy installation via Snap/`snapd`. However, in this project, we avoid using Snap packages because then the container has to run `systemd`, which is not usually done inside containers. Doing this is possible, and was done in this project previously, but it's more complicated, and it slows things down.

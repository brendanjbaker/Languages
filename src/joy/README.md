# Joy

Loading the standard libraries has the side-effect of printing `(library name) is loaded`. This is hard-coded into the library.

Therefore, `grep` is used to clean-up program output to eliminate such messages.

It is possible to use Joy without the standard library, but the standard library is very much integral to the Joy language itself.

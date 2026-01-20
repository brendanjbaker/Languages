# Cheating

Some languages and/or programs require some "cheating" to pass their test(s).

The needed "cheats" are disclosed below.

**BASIC**

Programs always end with a prompt to `Press enter to continue`, so an `enter` key input is provided, and that prompt is removed from output by `grep`. Additionally, `perl` removes excess newline output.

**CSS**

Puppeteer is used to render and interpret HTML and CSS, then selected DOM data is logged as "output." Additionally, `tr` or `sed` is used to clean up that output.

**HTML**

Console browser `w3m` is used to render the page as "output."

**Isabelle**

Isabelle is a theorem-proving language. To "run" a program, we prove a theory, and extract needed output with `awk`.

**Joy**

Loading the standard libraries has the side-effect of printing `(library name) is loaded`. This is hard-coded into the library. Therefore, `grep` is used to clean-up program output to eliminate such messages.

**Less**

Less can't output directly, however the `lessc` compiler can emit warnings. The `@warn` command is used for "output." Finally, `awk` is used to clean up the output.

**Sass**

Sass can't output directly, however the `sass` compiler can emit warnings. The `@debug` command is used for "output." Finally, `awk` is used to clean up the output.

**SQL**

A query cannot return an exit status/code directly, so output column(s) are expressed in CSV format, then the resulting CSV fields are "converted" by Bash to output and an exit status.

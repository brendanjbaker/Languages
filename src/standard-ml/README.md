# Standard ML

The `smlnj` interpreter prints various debugging information to `stdout`:

```
$ sml program.sml < /dev/null

Standard ML of New Jersey v110.79 [built: Mon Oct  3 21:03:45 2022]
[opening program.sml]
[autoloading]
[library $SMLNJ-BASIS/basis.cm is stable]
[library $SMLNJ-BASIS/(basis.cm):basis-common.cm is stable]
[autoloading done]
val sum = 5050 : int
[autoloading]
[autoloading done]
val sumText = "5050" : string
5050
-
```

Setting the `CM_VERBOSE` environment variable to `false` suppresses some of it, but not all of it:

```
$ export CM_VERBOSE='false'
$ sml program.sml < /dev/null

Standard ML of New Jersey v110.79 [built: Mon Oct  3 21:03:45 2022]
[opening program.sml]
val sum = 5050 : int
val sumText = "5050" : string
5050
-
```

Therefore, we sed `grep` to eliminate the `- ` line(s), and use `tail -n 1` to extract the last line
of output.

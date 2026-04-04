# Cyber

The syntax defined on the language's documentation website differs significantly from the last-released version (`0.4-DEV` on 24-Nov-2024).

Correct loop/projection syntax in latest `master` commit (apparently):

```
for 0..100 |i|:
    print(i)
```

The above is also the syntax described on the language's documentation website.

The equivalent syntax in the latest release (`0.4-DEV`):

```
for 0..100 -> i:
	print(i);
```

I've implemented things using the latest release (`0.4-DEV`).

Here is the source tree associated with the `0.4-DEV` release -- it may be useful to look in the `examples` or `test` subdirectories for syntax that will work with the `0.4-DEV` version.

https://github.com/fubark/cyber/tree/e77634aaf8bf8fc5f83c9ab098b9f22a023dd3f6

If & when I notice that a new release is published, I will try to remember to update everything accordingly.

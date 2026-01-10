# B

## Notes

In Ken Thompson's [Users' Reference to B](https://github.com/sergev/blang/raw/refs/heads/main/doc/kbman.pdf), the functions `printn` and `printf` are listed among the built-in library functions.

But unlike all other built-in functions, for these two functions, it says "see below".

Excerpt:

```
printf(format, arg1, ...).
   See section 9.3 below.

printn(number, base);
   See section 9.1 below.
```

In sections 9.1 and 9.3, B code listings for `printn` and `printf` are provided (included below).

So although `printf` and `printn` are described as being standard functions, the way to "include" them is to manually add them to your own B source.

The blang compiler provides `printf` as a built-in (but not `printn`). However, for historical accuracy, my programs will not use blang's built-in `printf`.

Similarly, `putchar()` would have been built-in, but it's not in blang. So I define it myself as `putchar(c)`, and it simply delegates the call to `write` (which blang provides). In 1972, you would just call `putchar()` directly.

In this manner, the programs look and work as they would have in 1972.

## Users' Reference to B (1972)

Selected verbatim excerpts from Ken Thompson's document are transcribed below.

### Section 9.1

```
9.1

/* The following function will print a non-negative number, n, to
   the base b, where 2<=b<=10, This routine uses the fact that
   in the ANSCII character set, the digits O to 9 have sequential
   code values.  */

   printn(n,b) {
      extrn putchar;
      auto a;

      if(a=n/b) /* assignment, not test for equality */
         printn(a, b); /* recursive */
      putchar(n%b + '0');
   }
```

### Section 9.3

```
9.3

/* The following function is a general formatting, printing, and
   conversion subroutine. The first argument is a format string.
   Character sequences,of the form '%x' are interpreted and cause
   conversion of type x’ of the next argument, other character
   sequences are printed verbatim. Thus

      printf(’’delta is %d*n”, delta);

   will convert the variable delta to decimal (%d) and print the
   string with the converted form of delta in place of %d. The
   conversions %d-decimal, %o-octal, *s-string and %c-character
   are allowed.

   This program calls upon the function 'printn'. (see section
   9.1) */

printf(fmt, x1,x2,x3,x4,x5,x6,x7,x8,x9) {
   extrn printn, char, putchar;
   auto adx, x, C, i, j;

   i = O; /* fmt index */
   adx = &xl; /* argument pointer */
loop:
   while((c=char(tmt,i++) ) != 'x') {
      if(c == '*e')
         return;
      putchar(c);
   }
   x = *adx++;
   switch C = char(fmt,i++) {

   case 'd': /* decimal */
   case 'o': /* octal */
      if(x < O) {
         x = -x;
         putchar('-');
      }
      printn(x, c=='o'?8:1O);
      goto loop;

   case 'c': /* char */
      putchar(x);
      goto loop;

   case 's': /* string */
      j = 0;
      while((c=char(x,j++)) != '*e')
         putchar(c);
      goto loop;
   }
   putchar('%');
   i--;
   adx--;
   goto loop;
}

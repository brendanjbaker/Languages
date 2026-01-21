# Lily

This is the Lily language as found here:

https://gitlab.com/FascinatedBox/lily

The language's syntax looks like this:

```
define sum(begin: *Integer = 5, end: *Integer = 10): Integer {
	var result: Integer = 0

	for i in begin...end: {
		result += i
	}

	return result
}
```

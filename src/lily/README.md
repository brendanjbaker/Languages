# Lily

This is the Lily language as found here:

https://github.com/thelilylang/lily

The language's syntax looks like this:

```
fun sum_recursive(from Int32, to Int32) Int32 =
	if from > to do
		return 0;
	end

	return from + sum_recursive(from + 1, to);
end
```

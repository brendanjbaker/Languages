# Elk

This is the Elk language as found here:

https://github.com/PaddiM8/elk

Its syntax looks like this:

```
#!/usr/bin/env elk

fn main() {
	println(sum_range(0, 100))
}

fn sum_range(begin, end) {
	let sum = 0

	for i in begin..(end + 1):
		sum += i

	sum
}
```

# Elk

This is the Elk language as found here:

https://github.com/elk-language/elk

Its syntax looks like this:

```
range := 0...100
iterator := range.iter
obj := IterableObject(iterator)
sum := obj.reduce |acc, n| -> acc + n

println sum
```

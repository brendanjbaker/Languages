| sum |
sum := (0 to: 100) inject: 0 into: [:acc :each | acc + each].
Transcript show: sum printString; cr.

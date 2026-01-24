app [main!] { cli: platform "https://github.com/roc-lang/basic-cli/releases/download/0.20.0/X73hGh05nNTkDHU06FHC0YfFaQB1pimX7gncRcao5mU.tar.br" }

import cli.Stdout
import cli.Arg exposing [Arg]

main! : List Arg => Result {} _
main! = |_args|
    sum = sum_range!(0, 100)
    sum_text = Num.to_str(sum)

    Stdout.line!(sum_text)

sum_range! : U64, U64 => U64
sum_range! = |begin, end|
    List.range({ start: At(begin), end: At(end) })
    |> List.walk(0, Num.add)

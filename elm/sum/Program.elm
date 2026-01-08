module Program exposing (main)

import Browser
import Html exposing (text)

sum : Int
sum =
    List.range 0 100
        |> List.sum

main =
    Browser.sandbox
        { init = ()
        , update = \_ model -> model
        , view = \_ -> text (String.fromInt sum)
        }

module Program exposing (main)

import Browser
import Html exposing (text)

main =
    Browser.sandbox
        { init = ()
        , update = \_ model -> model
        , view = \_ -> text "Hello, world!"
        }

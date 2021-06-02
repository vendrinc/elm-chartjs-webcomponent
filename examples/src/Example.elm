module Example exposing (Example)

import Html


type alias Example msg =
    { title : String
    , view : Html.Html msg
    , code : String
    }

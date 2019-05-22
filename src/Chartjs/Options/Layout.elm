module Chartjs.Options.Layout exposing (Layout(..), encodeLayout)

import Json.Encode as Encode
import Chartjs.Util as Encode
type Layout
    = Uniform Int
    | Specific { left : Int, right : Int, top : Int, bottom : Int }


encodeLayout : Layout -> Encode.Value
encodeLayout layout =
    case layout of
        Uniform i ->
            Encode.int i

        Specific { left, right, top, bottom } ->
            Encode.beginObject
                |> Encode.intField "left" left
                |> Encode.intField "right" right
                |> Encode.intField "top" top
                |> Encode.intField "bottom" bottom
                |> Encode.toValue

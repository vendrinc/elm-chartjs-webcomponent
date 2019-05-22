module Chartjs.Options.Title exposing (Title, defaultTitle, encodeTitle)

import Color exposing (Color)
import Json.Encode as Encode
import Chartjs.Common as Common
import Chartjs.Util as Encode
type alias Title =
    { display : Maybe Bool
    , position : Maybe Common.Position
    , fontSize : Maybe Int
    , fontFamily : Maybe String
    , fontColor : Maybe Color
    , fontStyle : Maybe String
    , padding : Maybe Int
    , lineHeight : Maybe String
    , text : Maybe String
    }


defaultTitle : Title
defaultTitle =
    { display = Nothing
    , position = Nothing
    , fontSize = Nothing
    , fontFamily = Nothing
    , fontColor = Nothing
    , fontStyle = Nothing
    , padding = Nothing
    , lineHeight = Nothing
    , text = Nothing
    }


encodeTitle : Title -> Encode.Value
encodeTitle title =
    Encode.beginObject
        |> Encode.maybeBoolField "display" title.display
        |> Encode.maybeCustomField "position" Common.encodePosition title.position
        |> Encode.maybeIntField "fontSize" title.fontSize
        |> Encode.maybeStringField "fontFamily" title.fontFamily
        |> Encode.maybeColorField "fontColor" title.fontColor
        |> Encode.maybeStringField "fontStyle" title.fontStyle
        |> Encode.maybeIntField "padding" title.padding
        |> Encode.maybeStringField "lineHeight" title.lineHeight
        |> Encode.maybeStringField "text" title.text
        |> Encode.toValue

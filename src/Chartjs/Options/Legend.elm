module Chartjs.Options.Legend exposing (Labels, Legend, defaultLabels, defaultLegend, encodeLabels, encodeLegend)

import Color exposing (Color)
import Json.Encode as Encode
import Chartjs.Common as Common
import Chartjs.Util as Encode

type alias Legend =
    { display : Maybe Bool
    , position : Maybe Common.Position
    , fullWidth : Maybe Bool
    , -- onClick,
      -- onHover,
      reverse : Maybe Bool
    , labels : Maybe Labels
    }


type alias Labels =
    { boxWidth : Maybe Int
    , fontSize : Maybe Int
    , fontStyle : Maybe String
    , fontColor : Maybe Color
    , fontFamily : Maybe String
    , padding : Maybe Int
    , --generate labels,
      --filter,
      usePointStyle : Maybe Bool
    }


defaultLegend : Legend
defaultLegend =
    { display = Nothing
    , position = Nothing
    , fullWidth = Nothing
    , reverse = Nothing
    , labels = Nothing
    }


defaultLabels : Labels
defaultLabels =
    { boxWidth = Nothing
    , fontSize = Nothing
    , fontStyle = Nothing
    , fontColor = Nothing
    , fontFamily = Nothing
    , padding = Nothing
    , --generate labels,
      --filter,
      usePointStyle = Nothing
    }


encodeLabels : Labels -> Encode.Value
encodeLabels labels =
    Encode.beginObject
        |> Encode.maybeIntField "boxWidth" labels.boxWidth
        |> Encode.maybeIntField "fontSize" labels.fontSize
        |> Encode.maybeStringField "fontStyle" labels.fontStyle
        |> Encode.maybeColorField "fontColor" labels.fontColor
        |> Encode.maybeStringField "fontFamily" labels.fontFamily
        |> Encode.maybeIntField "padding" labels.padding
        |> Encode.maybeBoolField "usePointStyle" labels.usePointStyle
        |> Encode.toValue


encodeLegend : Legend -> Encode.Value
encodeLegend legend =
    Encode.beginObject
        |> Encode.maybeBoolField "display" legend.display
        |> Encode.maybeCustomField "position" Common.encodePosition legend.position
        |> Encode.maybeBoolField "fullWidth" legend.fullWidth
        -- onClick,
        -- onHover,
        |> Encode.maybeBoolField "reverse" legend.reverse
        |> Encode.maybeCustomField "labels" encodeLabels legend.labels
        |> Encode.toValue

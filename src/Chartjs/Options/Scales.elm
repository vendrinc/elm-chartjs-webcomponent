module Chartjs.Options.Scales exposing (Axis, GridLines, Scales, Ticks, defaultAxis, defaultGridLines, defaultScales, defaultTicks, encodeAxis, encodeGridLines, encodeScales, encodeTicks)

import Color exposing (Color)
import Json.Encode as Encode
import Chartjs.Common as Common
import Chartjs.Util as Encode

type alias Scales =
    { xAxes : List Axis
    , yAxes : List Axis
    }


type alias Axis =
    { position : Maybe Common.Position
    , stacked : Maybe Bool
    , ticks : Maybe Ticks
    , gridLines : Maybe GridLines
    }


type alias Ticks =
    { fontFamily : Maybe String
    , callback : Maybe String
    , beginAtZero : Maybe Bool
    , min : Maybe Float
    , max : Maybe Float
    , maxTicksLimit : Maybe Int
    , precision : Maybe Int
    , stepSize : Maybe Float
    , suggestedMax : Maybe Float
    , suggestedMin : Maybe Float
    }


type alias GridLines =
    { display : Maybe Bool
    , color : Maybe (Common.PointProperty Color)
    }


defaultScales =
    { xAxes = []
    , yAxes = []
    }


defaultAxis =
    { position = Nothing
    , stacked = Nothing
    , ticks = Nothing
    , gridLines = Nothing
    }


defaultGridLines =
    { display = Nothing
    , color = Nothing
    }


defaultTicks : Ticks
defaultTicks =
    { fontFamily = Nothing
    , callback = Nothing
    , beginAtZero = Nothing
    , min = Nothing
    , max = Nothing
    , maxTicksLimit = Nothing
    , precision = Nothing
    , stepSize = Nothing
    , suggestedMax = Nothing
    , suggestedMin = Nothing
    }


encodeScales : Scales -> Encode.Value
encodeScales scales =
    Encode.beginObject
        |> Encode.listField "xAxes" encodeAxis scales.xAxes
        |> Encode.listField "yAxes" encodeAxis scales.yAxes
        |> Encode.toValue


encodeAxis : Axis -> Encode.Value
encodeAxis axis =
    Encode.beginObject
        |> Encode.maybeCustomField "position" Common.encodePosition axis.position
        |> Encode.maybeBoolField "stacked" axis.stacked
        |> Encode.maybeCustomField "ticks" encodeTicks axis.ticks
        |> Encode.maybeCustomField "gridLines" encodeGridLines axis.gridLines
        |> Encode.toValue


encodeTicks : Ticks -> Encode.Value
encodeTicks ticks =
    Encode.beginObject
        |> Encode.maybeStringField "fontFamily" ticks.fontFamily
        |> Encode.maybeStringField "callback" ticks.callback
        |> Encode.maybeBoolField "beginAtZero" ticks.beginAtZero
        |> Encode.maybeFloatField "min" ticks.min
        |> Encode.maybeFloatField "max" ticks.max
        |> Encode.maybeIntField "maxTicksLimit" ticks.maxTicksLimit
        |> Encode.maybeIntField "precision" ticks.precision
        |> Encode.maybeFloatField "stepSize" ticks.stepSize
        |> Encode.maybeFloatField "suggestedMax" ticks.suggestedMax
        |> Encode.maybeFloatField "suggestedMin" ticks.suggestedMin
        |> Encode.toValue


encodeGridLines : GridLines -> Encode.Value
encodeGridLines gridLines =
    Encode.beginObject
        |> Encode.maybeBoolField "display" gridLines.display
        |> Encode.maybeCustomField "color" (Common.encodePointProperty Encode.encodeColor) gridLines.color
        |> Encode.toValue

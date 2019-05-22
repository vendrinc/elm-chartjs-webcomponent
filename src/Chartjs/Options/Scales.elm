module Chartjs.Options.Scales exposing (Axis, GridLines, Scales, Ticks, defaultAxis, defaultGridLines, defaultScales, defaultTicks)

import Chartjs.Common as Common
import Color exposing (Color)


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

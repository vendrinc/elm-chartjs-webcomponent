module Chartjs.Options.Scales exposing (Axis, GridLines, Scales, Ticks, defaultAxis, defaultGridLines, defaultScales, defaultTicks)

{-| Types for managing scales configuration
@docs Axis, GridLines, Scales, Ticks, defaultAxis, defaultGridLines, defaultScales, defaultTicks
-} 

import Chartjs.Common as Common
import Color exposing (Color)

{-| Scales |-}
type alias Scales =
    { xAxes : List Axis
    , yAxes : List Axis
    }

{-| Axis |-}
type alias Axis =
    { position : Maybe Common.Position
    , stacked : Maybe Bool
    , ticks : Maybe Ticks
    , gridLines : Maybe GridLines
    }

{-| Ticks |-}
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

{-| GridLines |-}
type alias GridLines =
    { display : Maybe Bool
    , color : Maybe (Common.PointProperty Color)
    }

{-| defaultScales |-}
defaultScales : Scales
defaultScales =
    { xAxes = []
    , yAxes = []
    }

{-| defaultAxis |-}
defaultAxis : Axis
defaultAxis =
    { position = Nothing
    , stacked = Nothing
    , ticks = Nothing
    , gridLines = Nothing
    }

{-| defaultGridLines |-}
defaultGridLines : GridLines
defaultGridLines =
    { display = Nothing
    , color = Nothing
    }

{-| defaultTicks |-}
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

module Chartjs.Options.Scales exposing
    ( Scales, defaultScales, scalesFromAxes
    , Axis, defaultAxis
    , setPosition, setStacked, setTicks, setGridLines
    , Ticks, defaultTicks
    , setFontFamily, setBeginAtZero, setMin, setMax, setMaxTicksLimit, setPrecision
    , setStepSize, setSuggestedMax, setSuggestedMin, setFontColor
    , GridLines, defaultGridLines
    , setDisplay, setColor
    )

{-| todo

@docs Scales, defaultScales, scalesFromAxes
@docs Axis, defaultAxis
@docs setPosition, setStacked, setTicks, setGridLines

@docs Ticks, defaultTicks
@docs setFontFamily, setBeginAtZero, setMin, setMax, setMaxTicksLimit, setPrecision
@docs setStepSize, setSuggestedMax, setSuggestedMin, setFontColor

@docs GridLines, defaultGridLines
@docs setDisplay, setColor

-}

import Chartjs.Common as Common
import Color exposing (Color)


{-| Container for all axes of a chart
-}
type alias Scales =
    { xAxes : List Axis
    , yAxes : List Axis
    }


{-| Create an empty scales object
-}
defaultScales : Scales
defaultScales =
    { xAxes = []
    , yAxes = []
    }


{-| Build a scales object from a list of axes
-}
scalesFromAxes : List Axis -> List Axis -> Scales
scalesFromAxes xAxes yAxes =
    { xAxes = xAxes
    , yAxes = yAxes
    }


{-| A single axis for a chart
-}
type alias Axis =
    { position : Maybe Common.Position
    , stacked : Maybe Bool
    , ticks : Maybe Ticks
    , gridLines : Maybe GridLines
    }


{-| Create an empty axis object
-}
defaultAxis : Axis
defaultAxis =
    { position = Nothing
    , stacked = Nothing
    , ticks = Nothing
    , gridLines = Nothing
    }


{-| Position of the axis in the chart
-}
setPosition : Common.Position -> Axis -> Axis
setPosition position axis =
    { axis | position = Just position }


{-| ¯\_(ツ)\_/¯
-}
setStacked : Bool -> Axis -> Axis
setStacked bool axis =
    { axis | stacked = Just bool }


{-| -}
setTicks : Ticks -> Axis -> Axis
setTicks ticks axis =
    { axis | ticks = Just ticks }


{-| -}
setGridLines : GridLines -> Axis -> Axis
setGridLines gridLines axis =
    { axis | gridLines = Just gridLines }


{-| -}
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
    , fontColor : Maybe Color
    }


{-| Create an empty ticks object
-}
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
    , fontColor = Nothing
    }


{-| -}
setFontFamily : String -> Ticks -> Ticks
setFontFamily family ticks =
    { ticks | fontFamily = Just family }


{-| -}
setBeginAtZero : Bool -> Ticks -> Ticks
setBeginAtZero bool ticks =
    { ticks | beginAtZero = Just bool }


{-| -}
setMin : Float -> Ticks -> Ticks
setMin min ticks =
    { ticks | min = Just min }


{-| -}
setMax : Float -> Ticks -> Ticks
setMax max ticks =
    { ticks | max = Just max }


{-| -}
setMaxTicksLimit : Int -> Ticks -> Ticks
setMaxTicksLimit maxTicks ticks =
    { ticks | maxTicksLimit = Just maxTicks }


{-| -}
setPrecision : Int -> Ticks -> Ticks
setPrecision precision ticks =
    { ticks | precision = Just precision }


{-| -}
setStepSize : Float -> Ticks -> Ticks
setStepSize step ticks =
    { ticks | stepSize = Just step }


{-| -}
setSuggestedMax : Float -> Ticks -> Ticks
setSuggestedMax max ticks =
    { ticks | suggestedMax = Just max }


{-| -}
setSuggestedMin : Float -> Ticks -> Ticks
setSuggestedMin min ticks =
    { ticks | suggestedMin = Just min }


{-| -}
setFontColor : Color -> Ticks -> Ticks
setFontColor color ticks =
    { ticks | fontColor = Just color }


{-| Create an empty grid lines object
-}
type alias GridLines =
    { display : Maybe Bool
    , color : Maybe (Common.PointProperty Color)
    }


{-| -}
defaultGridLines : GridLines
defaultGridLines =
    { display = Nothing
    , color = Nothing
    }


{-| -}
setDisplay : Bool -> GridLines -> GridLines
setDisplay bool gridLines =
    { gridLines | display = Just bool }


{-| -}
setColor : Common.PointProperty Color -> GridLines -> GridLines
setColor color gridLines =
    { gridLines | color = Just color }

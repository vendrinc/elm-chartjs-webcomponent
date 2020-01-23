module Chartjs.Options.Scales exposing
    ( Axis
    , GridLines
    , Scales
    , Ticks
    , defaultAxis
    , defaultGridLines
    , defaultScales
    , defaultTicks
    , scalesFromAxes
    , setBeginAtZero
    , setColor
    , setDisplay
    , setFontColor
    , setFontFamily
    , setGridLines
    , setMax
    , setMaxTicksLimit
    , setMin
    , setPosition
    , setPrecision
    , setStacked
    , setStepSize
    , setSuggestedMax
    , setSuggestedMin
    , setTicks
    )

import Chartjs.Common as Common
import Color exposing (Color)


type alias Scales =
    { xAxes : List Axis
    , yAxes : List Axis
    }


defaultScales =
    { xAxes = []
    , yAxes = []
    }


scalesFromAxes : List Axis -> List Axis -> Scales
scalesFromAxes xAxes yAxes =
    { xAxes = xAxes
    , yAxes = yAxes
    }


type alias Axis =
    { position : Maybe Common.Position
    , stacked : Maybe Bool
    , ticks : Maybe Ticks
    , gridLines : Maybe GridLines
    }


defaultAxis =
    { position = Nothing
    , stacked = Nothing
    , ticks = Nothing
    , gridLines = Nothing
    }


setPosition : Common.Position -> Axis -> Axis
setPosition position axis =
    { axis | position = Just position }


setStacked : Bool -> Axis -> Axis
setStacked bool axis =
    { axis | stacked = Just bool }


setTicks : Ticks -> Axis -> Axis
setTicks ticks axis =
    { axis | ticks = Just ticks }


setGridLines : GridLines -> Axis -> Axis
setGridLines gridLines axis =
    { axis | gridLines = Just gridLines }


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


setFontFamily : String -> Ticks -> Ticks
setFontFamily family ticks =
    { ticks | fontFamily = Just family }


setBeginAtZero : Bool -> Ticks -> Ticks
setBeginAtZero bool ticks =
    { ticks | beginAtZero = Just bool }


setMin : Float -> Ticks -> Ticks
setMin min ticks =
    { ticks | min = Just min }


setMax : Float -> Ticks -> Ticks
setMax max ticks =
    { ticks | max = Just max }


setMaxTicksLimit : Int -> Ticks -> Ticks
setMaxTicksLimit maxTicks ticks =
    { ticks | maxTicksLimit = Just maxTicks }


setPrecision : Int -> Ticks -> Ticks
setPrecision precision ticks =
    { ticks | precision = Just precision }


setStepSize : Float -> Ticks -> Ticks
setStepSize step ticks =
    { ticks | stepSize = Just step }


setSuggestedMax : Float -> Ticks -> Ticks
setSuggestedMax max ticks =
    { ticks | suggestedMax = Just max }


setSuggestedMin : Float -> Ticks -> Ticks
setSuggestedMin min ticks =
    { ticks | suggestedMin = Just min }


setFontColor : Color -> Ticks -> Ticks
setFontColor color ticks =
    { ticks | fontColor = Just color }


type alias GridLines =
    { display : Maybe Bool
    , color : Maybe (Common.PointProperty Color)
    }


defaultGridLines =
    { display = Nothing
    , color = Nothing
    }


setDisplay : Bool -> GridLines -> GridLines
setDisplay bool gridLines =
    { gridLines | display = Just bool }


setColor : Common.PointProperty Color -> GridLines -> GridLines
setColor color gridLines =
    { gridLines | color = Just color }

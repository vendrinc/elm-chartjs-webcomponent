module Chartjs.Options.Scale exposing (..)

import Chartjs.Common as Common
import Chartjs.Options.Font exposing (FontSpec)
import Color exposing (Color)


type alias Scale =
    { id : String
    , type_ : ScaleType
    , axis : Maybe Common.IndexAxis
    , position : Maybe Common.Position
    , reverse : Maybe Bool
    , min : Maybe Float
    , max : Maybe Float
    , suggestedMin : Maybe Float
    , suggestedMax : Maybe Float
    , grid : Maybe ScaleGrid
    , title : Maybe ScaleTitle
    }


defaultScale : ScaleType -> String -> Scale
defaultScale type_ id =
    { id = id
    , type_ = type_
    , axis = Nothing
    , position = Nothing
    , reverse = Nothing
    , min = Nothing
    , max = Nothing
    , suggestedMin = Nothing
    , suggestedMax = Nothing
    , grid = Nothing
    , title = Nothing
    }


setAxis : Common.IndexAxis -> Scale -> Scale
setAxis axis scale =
    { scale | axis = Just axis }


setPosition : Common.Position -> Scale -> Scale
setPosition position scale =
    { scale | position = Just position }


setReverse : Bool -> Scale -> Scale
setReverse reverse scale =
    { scale | reverse = Just reverse }


setMin : Float -> Scale -> Scale
setMin min scale =
    { scale | min = Just min }


setMax : Float -> Scale -> Scale
setMax max scale =
    { scale | max = Just max }


setSuggestedMin : Float -> Scale -> Scale
setSuggestedMin min scale =
    { scale | min = Just min }


setSuggestedMax : Float -> Scale -> Scale
setSuggestedMax max scale =
    { scale | max = Just max }


setGrid : ScaleGrid -> Scale -> Scale
setGrid grid scale =
    { scale | grid = Just grid }


setTitle : ScaleTitle -> Scale -> Scale
setTitle title scale =
    { scale | title = Just title }


type ScaleType
    = Linear
    | Logarithmic
    | Categorical
    | Time


type alias ScaleGrid =
    { borderColor : Maybe Color
    , borderWidth : Maybe Int
    , gridColor : Maybe Color
    , drawBorder : Maybe Bool
    , drawTicks : Maybe Bool
    , tickColor : Maybe Color
    , tickLength : Maybe Int
    , tickWidth : Maybe Int
    }


defaultGrid : ScaleGrid
defaultGrid =
    { borderColor = Nothing
    , borderWidth = Nothing
    , gridColor = Nothing
    , drawBorder = Nothing
    , drawTicks = Nothing
    , tickColor = Nothing
    , tickLength = Nothing
    , tickWidth = Nothing
    }


setBorderColor : Color -> ScaleGrid -> ScaleGrid
setBorderColor color grid =
    { grid | borderColor = Just color }


setBorderWidth : Int -> ScaleGrid -> ScaleGrid
setBorderWidth width grid =
    { grid | borderWidth = Just width }


setGridColor : Color -> ScaleGrid -> ScaleGrid
setGridColor color grid =
    { grid | gridColor = Just color }


setDrawBorder : Bool -> ScaleGrid -> ScaleGrid
setDrawBorder bool grid =
    { grid | drawBorder = Just bool }


setDrawTicks : Bool -> ScaleGrid -> ScaleGrid
setDrawTicks bool grid =
    { grid | drawTicks = Just bool }


setTickColor : Color -> ScaleGrid -> ScaleGrid
setTickColor color grid =
    { grid | tickColor = Just color }


setTickLength : Int -> ScaleGrid -> ScaleGrid
setTickLength length grid =
    { grid | tickLength = Just length }


setTickWidth : Int -> ScaleGrid -> ScaleGrid
setTickWidth width grid =
    { grid | tickWidth = Just width }


type alias ScaleTitle =
    { text : String
    , color : Maybe Color
    , font : Maybe FontSpec
    , padding : Maybe Int
    }


defaultTitle : String -> ScaleTitle
defaultTitle text =
    { text = text
    , color = Nothing
    , font = Nothing
    , padding = Nothing
    }


setTitleColor : Color -> ScaleTitle -> ScaleTitle
setTitleColor color title =
    { title | color = Just color }


setTitlePadding : Int -> ScaleTitle -> ScaleTitle
setTitlePadding padding title =
    { title | padding = Just padding }


setTitleFont : FontSpec -> ScaleTitle -> ScaleTitle
setTitleFont font title =
    { title | font = Just font }

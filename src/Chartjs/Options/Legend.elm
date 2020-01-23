module Chartjs.Options.Legend exposing
    ( Labels
    , Legend
    , defaultLabels
    , defaultLegend
    , setBoxWidth
    , setDisplay
    , setFontColor
    , setFontFamily
    , setFontSize
    , setFontStyle
    , setFullWidth
    , setLabels
    , setPadding
    , setPosition
    , setReverse
    , setUsePointStyle
    )

import Chartjs.Common as Common
import Color exposing (Color)


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


setDisplay : Bool -> Legend -> Legend
setDisplay bool legend =
    { legend | display = Just bool }


setPosition : Common.Position -> Legend -> Legend
setPosition position legend =
    { legend | position = Just position }


setFullWidth : Bool -> Legend -> Legend
setFullWidth bool legend =
    { legend | fullWidth = Just bool }


setReverse : Bool -> Legend -> Legend
setReverse bool legend =
    { legend | reverse = Just bool }


setLabels : Labels -> Legend -> Legend
setLabels labels legend =
    { legend | labels = Just labels }


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


setBoxWidth : Int -> Labels -> Labels
setBoxWidth width labels =
    { labels | boxWidth = Just width }


setFontSize : Int -> Labels -> Labels
setFontSize size labels =
    { labels | fontSize = Just size }


setFontStyle : String -> Labels -> Labels
setFontStyle style labels =
    { labels | fontStyle = Just style }


setFontColor : Color -> Labels -> Labels
setFontColor color labels =
    { labels | fontColor = Just color }


setFontFamily : String -> Labels -> Labels
setFontFamily family labels =
    { labels | fontFamily = Just family }


setPadding : Int -> Labels -> Labels
setPadding padding labels =
    { labels | padding = Just padding }


setUsePointStyle : Bool -> Labels -> Labels
setUsePointStyle bool labels =
    { labels | usePointStyle = Just bool }

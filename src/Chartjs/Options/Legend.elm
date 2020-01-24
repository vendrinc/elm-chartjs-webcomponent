module Chartjs.Options.Legend exposing
    ( Legend, defaultLegend
    , setDisplay, setPosition, setFullWidth, setReverse, setLabels
    , Labels, defaultLabels, setBoxWidth, setFontSize, setFontStyle, setFontColor, setFontFamily, setPadding, setUsePointStyle
    )

{-| For more information, see <https://www.chartjs.org/docs/latest/configuration/legend.html>

@docs Legend, defaultLegend

@docs setDisplay, setPosition, setFullWidth, setReverse, setLabels

@docs Labels, defaultLabels, setBoxWidth, setFontSize, setFontStyle, setFontColor, setFontFamily, setPadding, setUsePointStyle

-}

import Chartjs.Common as Common
import Color exposing (Color)


{-| The chart legend displays data about the datasets that are appearing on the chart
-}
type alias Legend =
    { display : Maybe Bool
    , position : Maybe Common.Position
    , fullWidth : Maybe Bool
    , reverse : Maybe Bool
    , labels : Maybe Labels
    }


{-| Properties for the labels that make up the legend
-}
type alias Labels =
    { boxWidth : Maybe Int
    , fontSize : Maybe Int
    , fontStyle : Maybe String
    , fontColor : Maybe Color
    , fontFamily : Maybe String
    , padding : Maybe Int
    , usePointStyle : Maybe Bool
    }


{-| Create a blank legend object that can then be updated with the below functions
-}
defaultLegend : Legend
defaultLegend =
    { display = Nothing
    , position = Nothing
    , fullWidth = Nothing
    , reverse = Nothing
    , labels = Nothing
    }


{-| Is the legend shown?
-}
setDisplay : Bool -> Legend -> Legend
setDisplay bool legend =
    { legend | display = Just bool }


{-| Position of the legend (relative to the chart)
-}
setPosition : Common.Position -> Legend -> Legend
setPosition position legend =
    { legend | position = Just position }


{-| Marks that this box should take the full width of the canvas (pushing down other boxes).
This is unlikely to need to be changed in day-to-day use.
-}
setFullWidth : Bool -> Legend -> Legend
setFullWidth bool legend =
    { legend | fullWidth = Just bool }


{-| Legend will show datasets in reverse order
-}
setReverse : Bool -> Legend -> Legend
setReverse bool legend =
    { legend | reverse = Just bool }


{-| Set properties for the labels of this legend
-}
setLabels : Labels -> Legend -> Legend
setLabels labels legend =
    { legend | labels = Just labels }


{-| Create a blank labels object that can then be updated with the below functions
-}
defaultLabels : Labels
defaultLabels =
    { boxWidth = Nothing
    , fontSize = Nothing
    , fontStyle = Nothing
    , fontColor = Nothing
    , fontFamily = Nothing
    , padding = Nothing
    , usePointStyle = Nothing
    }


{-| Width of the coloured box
-}
setBoxWidth : Int -> Labels -> Labels
setBoxWidth width labels =
    { labels | boxWidth = Just width }


{-| Font size of the label text
-}
setFontSize : Int -> Labels -> Labels
setFontSize size labels =
    { labels | fontSize = Just size }


{-| Font style of the label text (normal, bold, etc.)
-}
setFontStyle : String -> Labels -> Labels
setFontStyle style labels =
    { labels | fontStyle = Just style }


{-| Color of the label text
-}
setFontColor : Color -> Labels -> Labels
setFontColor color labels =
    { labels | fontColor = Just color }


{-| Font family to use for label text
-}
setFontFamily : String -> Labels -> Labels
setFontFamily family labels =
    { labels | fontFamily = Just family }


{-| Padding between rows of coloured boxes
-}
setPadding : Int -> Labels -> Labels
setPadding padding labels =
    { labels | padding = Just padding }


{-| Label style will match corresponding point style
-}
setUsePointStyle : Bool -> Labels -> Labels
setUsePointStyle bool labels =
    { labels | usePointStyle = Just bool }

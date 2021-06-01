module Chartjs.Options.Legend exposing
    ( Legend, defaultLegend
    , setDisplay, setPosition, setFullWidth, setReverse, setLabels, setTitle
    , Labels, defaultLabels, setBoxWidth, setBoxHeight, setLabelColor, setLabelFont, setLabelPadding, setPointStyle
    , Title, defaultTitle, setTitleColor, setTitleFont, setTitlePadding
    )

{-| For more information, see <https://www.chartjs.org/docs/latest/configuration/legend.html>

@docs Legend, defaultLegend

@docs setDisplay, setPosition, setFullWidth, setReverse, setLabels, setTitle

@docs Labels, defaultLabels, setBoxWidth, setBoxHeight, setLabelColor, setLabelFont, setLabelPadding, setPointStyle

@docs Title, defaultTitle, setTitleColor, setTitleFont, setTitlePadding

-}

import Chartjs.Common as Common
import Chartjs.Options.Font exposing (FontSpec)
import Color exposing (Color)


{-| The chart legend displays data about the datasets that are appearing on the chart
-}
type alias Legend =
    { display : Maybe Bool
    , position : Maybe Common.Position
    , fullWidth : Maybe Bool
    , reverse : Maybe Bool
    , labels : Maybe Labels
    , title : Maybe Title
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
    , title = Nothing
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


{-| Set properties for the title of this legend
-}
setTitle : Title -> Legend -> Legend
setTitle title legend =
    { legend | title = Just title }


{-| Properties for the labels that make up the legend
-}
type alias Labels =
    { boxWidth : Maybe Int
    , boxHeight : Maybe Int
    , color : Maybe Color
    , font : Maybe FontSpec
    , padding : Maybe Int
    , pointStyle : Maybe Common.PointStyle
    }


{-| Create a blank labels object that can then be updated with the below functions
-}
defaultLabels : Labels
defaultLabels =
    { boxWidth = Nothing
    , boxHeight = Nothing
    , color = Nothing
    , font = Nothing
    , padding = Nothing
    , pointStyle = Nothing
    }


{-| Width of the coloured box
-}
setBoxWidth : Int -> Labels -> Labels
setBoxWidth width labels =
    { labels | boxWidth = Just width }


setBoxHeight : Int -> Labels -> Labels
setBoxHeight height labels =
    { labels | boxHeight = Just height }


setLabelColor : Color -> Labels -> Labels
setLabelColor color labels =
    { labels | color = Just color }


setLabelFont : FontSpec -> Labels -> Labels
setLabelFont font labels =
    { labels | font = Just font }


setLabelPadding : Int -> Labels -> Labels
setLabelPadding padding labels =
    { labels | padding = Just padding }


{-| Set a special point style for the legend label boxes
-}
setPointStyle : Common.PointStyle -> Labels -> Labels
setPointStyle style labels =
    { labels | pointStyle = Just style }


type alias Title =
    { text : String
    , color : Maybe Color
    , font : Maybe FontSpec
    , padding : Maybe Int
    }


defaultTitle : String -> Title
defaultTitle text =
    { text = text
    , color = Nothing
    , font = Nothing
    , padding = Nothing
    }


setTitleColor : Color -> Title -> Title
setTitleColor color title =
    { title | color = Just color }


setTitleFont : FontSpec -> Title -> Title
setTitleFont font title =
    { title | font = Just font }


setTitlePadding : Int -> Title -> Title
setTitlePadding padding title =
    { title | padding = Just padding }

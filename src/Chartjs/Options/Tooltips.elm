module Chartjs.Options.Tooltips exposing
    ( Tooltips, defaultTooltips
    , PositionMode(..), Mode(..)
    )

{-| For more information, see <https://www.chartjs.org/docs/latest/configuration/tooltip.html>

Please note that this module does not have updater functions and you will need to use record update syntax if using this functionality

@docs Tooltips, defaultTooltips

@docs PositionMode, Mode

-}

import Color exposing (Color)


{-| Tooltips are displayed when interacting with charts
-}
type alias Tooltips =
    { enabled : Maybe Bool
    , mode : Maybe Mode
    , intersect : Maybe Bool
    , position : Maybe PositionMode

    --, callbacks : Maybe Callbacks
    , backgroundColor : Maybe Color
    , titleFontFamily : Maybe String
    , titleFontSize : Maybe Int
    , titleFontStyle : Maybe String
    , titleFontColor : Maybe Color
    , titleSpacing : Maybe Int
    , titleMarginBottom : Maybe Int
    , bodyFontFamily : Maybe String
    , bodyFontSize : Maybe Int
    , bodyFontStyle : Maybe String
    , bodyFontColor : Maybe Color
    , bodySpacing : Maybe Int
    , footerFontFamily : Maybe String
    , footerFontSize : Maybe Int
    , footerFontStyle : Maybe String
    , footerFontColor : Maybe Color
    , footerSpacing : Maybe Int
    , footerMarginTop : Maybe Int
    , xPadding : Maybe Int
    , yPadding : Maybe Int
    , caretPadding : Maybe Int
    , carretSize : Maybe Int
    , cornerRadius : Maybe Int
    , multiKeyBackground : Maybe Color
    , displayColors : Maybe Bool
    , borderColor : Maybe Bool
    , borderWidth : Maybe Int
    }


{-| Positioning mode for tooltips

Average will place the tooltip at the average position of the displayed items
Nearest will place the tooltip at the element closest to the event position

-}
type PositionMode
    = PositionModeAverage
    | PositionModeNearest


{-| Controls what elements are displayed in the tooltip
Point: finds all items that intersect the point
Nearest: gets the items that are at the nearest distance to the point
Index: finds item at the same index
X: find all items that interesct (based on X axis only)
Y: find all items that intersect (based on Y axis only)
-}
type Mode
    = Point
    | Nearest
    | Index
    | DataSet
    | X
    | Y


{-| Create a blank tooltips object
-}
defaultTooltips : Tooltips
defaultTooltips =
    { enabled = Nothing
    , mode = Nothing
    , intersect = Nothing
    , position = Nothing

    --, callbacks = Nothing
    , backgroundColor = Nothing
    , titleFontFamily = Nothing
    , titleFontSize = Nothing
    , titleFontStyle = Nothing
    , titleFontColor = Nothing
    , titleSpacing = Nothing
    , titleMarginBottom = Nothing
    , bodyFontFamily = Nothing
    , bodyFontSize = Nothing
    , bodyFontStyle = Nothing
    , bodyFontColor = Nothing
    , bodySpacing = Nothing
    , footerFontFamily = Nothing
    , footerFontSize = Nothing
    , footerFontStyle = Nothing
    , footerFontColor = Nothing
    , footerSpacing = Nothing
    , footerMarginTop = Nothing
    , xPadding = Nothing
    , yPadding = Nothing
    , caretPadding = Nothing
    , carretSize = Nothing
    , cornerRadius = Nothing
    , multiKeyBackground = Nothing
    , displayColors = Nothing
    , borderColor = Nothing
    , borderWidth = Nothing
    }

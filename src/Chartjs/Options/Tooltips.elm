module Chartjs.Options.Tooltips exposing (Callbacks, Mode(..), PositionMode(..), Tooltips, defaultCallbacks, defaultTooltips)

import Color exposing (Color)


type alias Tooltips =
    { enabled : Maybe Bool
    , -- custom,
      mode : Maybe Mode
    , intersect : Maybe Bool
    , position : Maybe PositionMode
    , callbacks : Maybe Callbacks
    , -- itemSort,
      -- filter,
      backgroundColor : Maybe Color
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


type alias Callbacks =
    { label : Maybe String
    }


type PositionMode
    = PositionModeAverage
    | PositionModeNearest


type Mode
    = Point
    | Nearest
    | Index
    | DataSet
    | X
    | Y


defaultTooltips : Tooltips
defaultTooltips =
    { enabled = Nothing
    , mode = Nothing
    , intersect = Nothing
    , position = Nothing
    , callbacks = Nothing
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


defaultCallbacks : Callbacks
defaultCallbacks =
    { label = Nothing
    }

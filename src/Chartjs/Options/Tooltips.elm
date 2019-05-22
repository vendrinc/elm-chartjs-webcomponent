module Chartjs.Options.Tooltips exposing (Callbacks, Mode(..), PositionMode(..), Tooltips, defaultCallbacks, defaultTooltips, encodeCallbacks, encodeMode, encodePositionMode, encodeTooltips)

import Color exposing (Color)
import Json.Encode as Encode
import Chartjs.Util as Encode
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


encodeTooltips : Tooltips -> Encode.Value
encodeTooltips tooltips =
    Encode.beginObject
        |> Encode.maybeBoolField "enabled" tooltips.enabled
        |> Encode.maybeCustomField "mode" encodeMode tooltips.mode
        |> Encode.maybeBoolField "intersect" tooltips.intersect
        |> Encode.maybeCustomField "position" encodePositionMode tooltips.position
        |> Encode.maybeCustomField "callbacks" encodeCallbacks tooltips.callbacks
        |> Encode.maybeColorField "backgroundColor" tooltips.backgroundColor
        |> Encode.maybeStringField "titleFontFamily" tooltips.titleFontFamily
        |> Encode.maybeIntField "titleFontSize" tooltips.titleFontSize
        |> Encode.maybeStringField "titleFontStyle" tooltips.titleFontStyle
        |> Encode.maybeColorField "titleFontColor" tooltips.titleFontColor
        |> Encode.maybeIntField "titleSpacing" tooltips.titleSpacing
        |> Encode.maybeIntField "titleMarginBottom" tooltips.titleMarginBottom
        |> Encode.maybeStringField "bodyFontFamily" tooltips.bodyFontFamily
        |> Encode.maybeIntField "bodyFontSize" tooltips.bodyFontSize
        |> Encode.maybeStringField "bodyFontStyle" tooltips.bodyFontStyle
        |> Encode.maybeColorField "bodyFontColor" tooltips.bodyFontColor
        |> Encode.maybeIntField "bodySpacing" tooltips.bodySpacing
        |> Encode.maybeStringField "footerFontFamily" tooltips.footerFontFamily
        |> Encode.maybeIntField "footerFontSize" tooltips.footerFontSize
        |> Encode.maybeStringField "footerFontStyle" tooltips.footerFontStyle
        |> Encode.maybeColorField "footerFontColor" tooltips.footerFontColor
        |> Encode.maybeIntField "footerSpacing" tooltips.footerSpacing
        |> Encode.maybeIntField "footerMarginTop" tooltips.footerMarginTop
        |> Encode.maybeIntField "xPadding" tooltips.xPadding
        |> Encode.maybeIntField "yPadding" tooltips.yPadding
        |> Encode.maybeIntField "caretPadding" tooltips.caretPadding
        |> Encode.maybeIntField "carretSize" tooltips.carretSize
        |> Encode.maybeIntField "cornerRadius" tooltips.cornerRadius
        |> Encode.maybeColorField "multiKeyBackground" tooltips.multiKeyBackground
        |> Encode.maybeBoolField "displayColors" tooltips.displayColors
        |> Encode.maybeBoolField "borderColor" tooltips.borderColor
        |> Encode.maybeIntField "borderWidth" tooltips.borderWidth
        |> Encode.toValue


encodeMode : Mode -> Encode.Value
encodeMode mode =
    (case mode of
        Point ->
            "point"

        Nearest ->
            "nearest"

        Index ->
            "index"

        DataSet ->
            "dataset"

        X ->
            "x"

        Y ->
            "y"
    )
        |> Encode.string


encodePositionMode : PositionMode -> Encode.Value
encodePositionMode positionMode =
    (case positionMode of
        PositionModeAverage ->
            "average"

        PositionModeNearest ->
            "nearest"
    )
        |> Encode.string


encodeCallbacks : Callbacks -> Encode.Value
encodeCallbacks callbacks =
    Encode.beginObject
        |> Encode.maybeStringField "label" callbacks.label
        |> Encode.toValue

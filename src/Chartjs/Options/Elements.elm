module Chartjs.Options.Elements exposing (Arc, Elements, Line, LineFill(..), Point, Rectangle, defaultElements, defaultPoint, encodeArc, encodeElements, encodeLine, encodeLineFill, encodePoint, encodeRectangle)

-- https://www.chartjs.org/docs/latest/configuration/elements.html

import Color exposing (Color)
import Json.Encode as Encode
import Chartjs.Common as Common
import Chartjs.Util as Encode

type alias Elements =
    { point : Maybe Point
    , line : Maybe Line
    , rectangle : Maybe Rectangle
    , arc : Maybe Arc
    }


type alias Point =
    { radius : Maybe Int
    , pointStyle : Maybe Common.PointStyle
    , rotation : Maybe Int
    , backgroundColor : Maybe Color
    , borderWidth : Maybe Int
    , borderColor : Maybe Color
    , hitRadius : Maybe Int
    , hoverRadius : Maybe Int
    , hoverBorderWidth : Maybe Int
    }


type alias Line =
    { tension : Maybe Float
    , backgroundColor : Maybe Color
    , borderWidth : Maybe Int
    , borderColor : Maybe Color
    , borderCapStyle : Maybe Common.LineCap
    , borderDash : Maybe (List Int)
    , borderDashOffset : Maybe Int
    , borderJoinStyle : Maybe Common.LineJoin
    , capBezierPoints : Maybe Bool
    , fill : Maybe LineFill
    , stepped : Maybe Bool
    }


type LineFill
    = Zero
    | Top
    | Bottom
    | NoFill


type alias Rectangle =
    { backgroundColor : Maybe Color
    , borderWidth : Maybe Int
    , borderColor : Maybe Color
    , borderSkipped : Maybe Common.Position
    }


type alias Arc =
    { backgroundColor : Maybe Color
    , borderColor : Maybe Color
    , borderWidth : Maybe Int
    }


defaultElements : Elements
defaultElements =
    { point = Nothing
    , line = Nothing
    , rectangle = Nothing
    , arc = Nothing
    }


defaultPoint : Point
defaultPoint =
    { radius = Nothing
    , pointStyle = Nothing
    , rotation = Nothing
    , backgroundColor = Nothing
    , borderWidth = Nothing
    , borderColor = Nothing
    , hitRadius = Nothing
    , hoverRadius = Nothing
    , hoverBorderWidth = Nothing
    }


encodeElements : Elements -> Encode.Value
encodeElements elements =
    Encode.beginObject
        |> Encode.maybeCustomField "point" encodePoint elements.point
        |> Encode.maybeCustomField "line" encodeLine elements.line
        |> Encode.maybeCustomField "rectangle" encodeRectangle elements.rectangle
        |> Encode.maybeCustomField "arc" encodeArc elements.arc
        |> Encode.toValue


encodePoint : Point -> Encode.Value
encodePoint point =
    Encode.beginObject
        |> Encode.maybeIntField "radius" point.radius
        |> Encode.maybeCustomField "pointStyle" Common.encodePointStyle point.pointStyle
        |> Encode.maybeIntField "rotation" point.rotation
        |> Encode.maybeColorField "backgroundColor" point.backgroundColor
        |> Encode.maybeIntField "borderWidth" point.borderWidth
        |> Encode.maybeColorField "borderColor" point.borderColor
        |> Encode.maybeIntField "hitRadius" point.hitRadius
        |> Encode.maybeIntField "hoverRadius" point.hoverRadius
        |> Encode.maybeIntField "hoverBorderWidth" point.hoverBorderWidth
        |> Encode.toValue


encodeLine : Line -> Encode.Value
encodeLine line =
    Encode.beginObject
        |> Encode.maybeFloatField "tension" line.tension
        |> Encode.maybeColorField "backgroundColor" line.backgroundColor
        |> Encode.maybeIntField "borderWidth" line.borderWidth
        |> Encode.maybeColorField "borderColor" line.borderColor
        |> Encode.maybeCustomField "borderCapStyle" Common.encodeLineCap line.borderCapStyle
        |> Encode.maybeListField "borderDash" Encode.int line.borderDash
        |> Encode.maybeIntField "borderDashOffset" line.borderDashOffset
        |> Encode.maybeCustomField "borderJoinStyle" Common.encodeLineJoin line.borderJoinStyle
        |> Encode.maybeBoolField "capBezierPoints" line.capBezierPoints
        |> Encode.maybeCustomField "fill" encodeLineFill line.fill
        |> Encode.maybeBoolField "stepped" line.stepped
        |> Encode.toValue


encodeLineFill : LineFill -> Encode.Value
encodeLineFill lineFill =
    case lineFill of
        Zero ->
            Encode.string "zero"

        Top ->
            Encode.string "top"

        Bottom ->
            Encode.string "bottom"

        NoFill ->
            Encode.bool False


encodeRectangle : Rectangle -> Encode.Value
encodeRectangle rectangle =
    Encode.beginObject
        |> Encode.maybeColorField "backgroundColor" rectangle.backgroundColor
        |> Encode.maybeIntField "borderWidth" rectangle.borderWidth
        |> Encode.maybeColorField "borderColor" rectangle.borderColor
        |> Encode.maybeCustomField "borderSkipped" Common.encodePosition rectangle.borderSkipped
        |> Encode.toValue


encodeArc : Arc -> Encode.Value
encodeArc arc =
    Encode.beginObject
        |> Encode.maybeColorField "backgroundColor" arc.backgroundColor
        |> Encode.maybeColorField "borderColor" arc.borderColor
        |> Encode.maybeIntField "borderWidth" arc.borderWidth
        |> Encode.toValue

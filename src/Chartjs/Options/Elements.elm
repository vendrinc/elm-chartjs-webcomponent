module Chartjs.Options.Elements exposing (Arc, Elements, Line, LineFill(..), Point, Rectangle, defaultElements, defaultPoint)

-- https://www.chartjs.org/docs/latest/configuration/elements.html

import Chartjs.Common as Common
import Color exposing (Color)


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

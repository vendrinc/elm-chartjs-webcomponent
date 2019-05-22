module Chartjs.Options.Elements exposing (Arc, Elements, Line, LineFill(..), Point, Rectangle, defaultElements, defaultPoint)

{-| Types for managing element configuration, see https://www.chartjs.org/docs/latest/configuration/elements.html

@docs Arc, Elements, Line, LineFill, Point, Rectangle, defaultElements, defaultPoint
-} 

import Chartjs.Common as Common
import Color exposing (Color)

{-| Elements |-}
type alias Elements =
    { point : Maybe Point
    , line : Maybe Line
    , rectangle : Maybe Rectangle
    , arc : Maybe Arc
    }

{-| Point |-}
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

{-| Line |-}
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

{-| LineFill |-}
type LineFill
    = Zero
    | Top
    | Bottom
    | NoFill

{-| Rectangle |-}
type alias Rectangle =
    { backgroundColor : Maybe Color
    , borderWidth : Maybe Int
    , borderColor : Maybe Color
    , borderSkipped : Maybe Common.Position
    }

{-| Arc |-}
type alias Arc =
    { backgroundColor : Maybe Color
    , borderColor : Maybe Color
    , borderWidth : Maybe Int
    }

{-| defaultElements |-}
defaultElements : Elements
defaultElements =
    { point = Nothing
    , line = Nothing
    , rectangle = Nothing
    , arc = Nothing
    }

{-| defaultPoint |-}
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

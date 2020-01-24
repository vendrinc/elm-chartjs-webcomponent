module Chartjs.Options.Elements exposing (Elements, defaultElements, Point, defaultPoint, Line, LineFill(..), Rectangle, Arc)

{-| While there is ways to configure the styling of each dataset, sometimes you want custom styles applied to all datasets
For more information, see <https://www.chartjs.org/docs/latest/configuration/elements.html>

Please note that this module does not have updater functions and you will need to use record update syntax if using this functionality

@docs Elements, defaultElements, Point, defaultPoint, Line, LineFill, Rectangle, Arc

-}

import Chartjs.Common as Common
import Color exposing (Color)


{-| Controls for all element types in a chart
-}
type alias Elements =
    { point : Maybe Point
    , line : Maybe Line
    , rectangle : Maybe Rectangle
    , arc : Maybe Arc
    }


{-| Point specific properties
-}
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


{-| Line specific properties
-}
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


{-| Line fill mode
Useful for area charts
-}
type LineFill
    = Zero
    | Top
    | Bottom
    | NoFill


{-| Rectangle specific properties (eg. bar charts)
-}
type alias Rectangle =
    { backgroundColor : Maybe Color
    , borderWidth : Maybe Int
    , borderColor : Maybe Color
    , borderSkipped : Maybe Common.Position
    }


{-| Arc specific properties (eg. pie chart, polar chart)
-}
type alias Arc =
    { backgroundColor : Maybe Color
    , borderColor : Maybe Color
    , borderWidth : Maybe Int
    }


{-| Create a blank elements object
-}
defaultElements : Elements
defaultElements =
    { point = Nothing
    , line = Nothing
    , rectangle = Nothing
    , arc = Nothing
    }


{-| Create a blank point object
-}
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

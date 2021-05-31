module Chartjs.Common exposing
    ( PointStyle(..), LineCap(..), LineJoin(..), Position(..), PointProperty(..)
    , defaultColors
    )

{-| Common types used for various configuration properties

@docs PointStyle, LineCap, LineJoin, Position, PointProperty

@docs defaultColors

-}

import Color exposing (Color)


{-| For more information, see <https://www.chartjs.org/samples/latest/charts/line/point-styles.html>
-}
type PointStyle
    = Circle
    | Cross
    | CrossRot
    | Dash
    | Line
    | Rect
    | RectRounded
    | RectRot
    | Star
    | Triangle
    | Image String


{-| For more information, see <https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/lineCap>
-}
type LineCap
    = LineCapButt
    | LineCapRound
    | LineCapSquare


{-| For more information, see <https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/lineJoin>
-}
type LineJoin
    = LineJoinBevel
    | LineJoinRound
    | LineJoinMiter


{-| Positioning often used in options such as axes and legends
-}
type Position
    = Top
    | Left
    | Bottom
    | Right


{-| Many properties that apply to datasets
can either be applied to the whole dataset, or to each individual point

For applying a property to every point in the dataset, use the All type
For using a list of properties on a per-point basis, use the PerPoint type

-}
type PointProperty a
    = All a
    | PerPoint (List a)


{-| Need some default colours? You can use this helpful list of colours!

These colours are taken from the ChartJs Utils: <https://github.com/chartjs/Chart.js/blob/master/docs/scripts/utils.js#L127>

-}
defaultColors : List Color
defaultColors =
    [ Color.rgb255 255 99 132
    , Color.rgb255 255 159 64
    , Color.rgb255 255 205 86
    , Color.rgb255 75 192 192
    , Color.rgb255 54 162 235
    , Color.rgb255 153 102 255
    , Color.rgb255 201 203 207
    ]

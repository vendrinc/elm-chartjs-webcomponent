module Chartjs.Common exposing (LineCap(..), LineJoin(..), PointProperty(..), PointStyle(..), Position(..))


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


type LineCap
    = LineCapButt
    | LineCapRound
    | LineCapSquare


type LineJoin
    = LineJoinBevel
    | LineJoinRound
    | LineJoinMiter


type Position
    = Top
    | Left
    | Bottom
    | Right


type PointProperty a
    = All a
    | PerPoint (List a)

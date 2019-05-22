module Chartjs.Common exposing (LineCap(..), LineJoin(..), PointProperty(..), PointStyle(..), Position(..))

{-| Types for managing common configuration

@docs LineCap, LineJoin, PointProperty, PointStyle, Position

|-}

{-| PointStyle |-}


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



{-| LineCap |-}


type LineCap
    = LineCapButt
    | LineCapRound
    | LineCapSquare



{-| LineJoin |-}


type LineJoin
    = LineJoinBevel
    | LineJoinRound
    | LineJoinMiter



{-| Position |-}


type Position
    = Top
    | Left
    | Bottom
    | Right



{-| PointProperty |-}


type PointProperty a
    = All a
    | PerPoint (List a)

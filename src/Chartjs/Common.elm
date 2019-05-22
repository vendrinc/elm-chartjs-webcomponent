module Chartjs.Common exposing (LineCap(..), LineJoin(..), PointProperty(..), PointStyle(..), Position(..), encodeLineCap, encodeLineJoin, encodePointProperty, encodePointStyle, encodePosition)

import Json.Encode as Encode
import Chartjs.Util as Encode

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


encodePosition : Position -> Encode.Value
encodePosition position =
    (case position of
        Top ->
            "top"

        Left ->
            "left"

        Bottom ->
            "bottom"

        Right ->
            "right"
    )
        |> Encode.string


encodePointProperty : (a -> Encode.Value) -> PointProperty a -> Encode.Value
encodePointProperty valueEncoder value =
    case value of
        All innerValue ->
            valueEncoder innerValue

        PerPoint valueList ->
            Encode.list valueEncoder valueList


encodePointStyle : PointStyle -> Encode.Value
encodePointStyle pointStyle =
    (case pointStyle of
        Circle ->
            "circle"

        Cross ->
            "cross"

        CrossRot ->
            "crossrot"

        Dash ->
            "dash"

        Line ->
            "line"

        Rect ->
            "rect"

        RectRounded ->
            "rectrounded"

        RectRot ->
            "rectrot"

        Star ->
            "star"

        Triangle ->
            "triangle"

        Image str ->
            "<img src=\"" ++ str ++ "\"/>"
    )
        |> Encode.string


encodeLineCap : LineCap -> Encode.Value
encodeLineCap lineCap =
    (case lineCap of
        LineCapButt ->
            "butt"

        LineCapRound ->
            "round"

        LineCapSquare ->
            "square"
    )
        |> Encode.string


encodeLineJoin : LineJoin -> Encode.Value
encodeLineJoin lineJoin =
    (case lineJoin of
        LineJoinBevel ->
            "bevel"

        LineJoinRound ->
            "round"

        LineJoinMiter ->
            "miter"
    )
        |> Encode.string

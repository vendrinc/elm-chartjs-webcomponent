module Utils exposing (red, orange, yellow, green, blue, purple, grey, defaultColors)

{-| 
These colours are taken from the ChartJs Utils: <https://github.com/chartjs/Chart.js/blob/master/docs/scripts/utils.js#L127>

-}

import Color exposing (Color)

red : Color
red =
    Color.rgb255 255 99 132

orange : Color
orange =
    Color.rgb255 255 159 64

yellow : Color
yellow =
    Color.rgb255 255 205 86

green : Color
green =
    Color.rgb255 75 192 192

blue : Color
blue =
    Color.rgb255 54 162 235

purple : Color
purple =
    Color.rgb255 153 102 255

grey : Color
grey =
    Color.rgb255 201 203 207



defaultColors : List Color
defaultColors =
    [ red
    , orange
    , yellow
    , green
    , blue
    , purple
    , grey
    ]
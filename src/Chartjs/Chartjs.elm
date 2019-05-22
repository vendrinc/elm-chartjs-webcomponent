module Chartjs.Chartjs exposing (Chart, ChartType(..), chart, defaultChart)

{-| A type-safe bridge to a Chartjs web component.

Note: this library isn't usable without including Chartjs as a Javascript dependency in your project,
along with the sister Javascript web component that goes with this library.
Please see instructions here: https://github.com/Blissfully/elm-chartjs-webcomponent

@docs Chart, ChartType, chart, defaultChart

-}

import Html exposing (..)
import Html.Attributes exposing (..)
import Json.Encode as Encode
import Chartjs.Data as Data
import Chartjs.Options as Options
import Chartjs.Util as Encode

{-| Required definition for a Chartjs chart
-}
type alias Chart =
    { chartType : ChartType
    , data : Data.Data
    , options : Options.Options
    }


{-| Basic type of chart
-}
type ChartType
    = Bar
    | Line
    | Doughnut
    | Pie

{-| Given dimensions and a chart, creates an HMTL node
-}
chart : Int -> Int -> Chart -> Html msg
chart height width chart_ =
    node "chart-component"
        [ property "chartWidth" <| Encode.int height
        , property "chartHeight" <| Encode.int width
        , property "chartConfig" <| encodeChart chart_
        ]
        []

{-| Given a type, creates a sane Chart config you can update
-}
defaultChart : ChartType -> Chart
defaultChart chartType =
    { chartType = chartType
    , data = Data.defaultData
    , options = Options.defaultOptions
    }


encodeChart : Chart -> Encode.Value
encodeChart chart_ =
    Encode.beginObject
        |> Encode.customField "type" encodeChartType chart_.chartType
        |> Encode.customField "data" Data.encodeData chart_.data
        |> Encode.customField "options" Options.encodeOptions chart_.options
        |> Encode.toValue


encodeChartType : ChartType -> Encode.Value
encodeChartType chartType =
    (case chartType of
        Bar ->
            "bar"

        Line ->
            "line"

        Doughnut ->
            "doughnut"

        Pie ->
            "pie"
    )
        |> Encode.string

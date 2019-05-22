module Chartjs.Chartjs exposing (Chart, ChartType(..), chart, defaultChart, encodeChart, encodeChartType)

import Html exposing (..)
import Html.Attributes exposing (..)
import Json.Encode as Encode
import Chartjs.Data as Data
import Chartjs.Options as Options
import Chartjs.Util as Encode


type alias Chart =
    { chartType : ChartType
    , data : Data.Data
    , options : Options.Options
    }


type ChartType
    = Bar
    | Line
    | Doughnut
    | Pie


chart : Int -> Int -> Chart -> Html msg
chart height width chart_ =
    node "chart-component"
        [ property "chartWidth" <| Encode.int height
        , property "chartHeight" <| Encode.int width
        , property "chartConfig" <| encodeChart chart_
        ]
        []


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

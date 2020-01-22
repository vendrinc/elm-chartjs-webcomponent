module Chartjs.Chart exposing
    ( Chart, chart, defaultChart
    , Type(..)
    )

{-| A type-safe bridge to a Chartjs web component.

Note: this library isn't usable without including Chartjs as a Javascript dependency in your project,
along with the sister Javascript web component that goes with this library.
Please see instructions here: <https://github.com/Blissfully/elm-chartjs-webcomponent>

@docs Chart, ChartType, chart, defaultChart

-}

import Chartjs.Data as Data
import Chartjs.Internal.Encode
import Chartjs.Internal.Util as Encode
import Chartjs.Options as Options
import Html exposing (..)
import Html.Attributes exposing (..)
import Json.Encode as Encode


{-| Required definition for a Chartjs chart
-}
type alias Chart =
    { chartType : Type
    , data : Data.Data
    , options : Options.Options
    }


{-| Basic type of chart
-}
type Type
    = Bar
    | HorizontalBar
    | Line
    | Doughnut
    | Pie


{-| Given dimensions and a chart, creates an HMTL node
-}
chart : Chart -> Html msg
chart chart_ =
    node "chart-component"
        [ property "chartConfig" <| encodeChart chart_ ]
        []


{-| Given a type, creates a sane Chart config you can update
-}
defaultChart : Type -> Chart
defaultChart chartType =
    { chartType = chartType
    , data = Data.defaultData
    , options = Options.defaultOptions
    }


encodeChart : Chart -> Encode.Value
encodeChart chart_ =
    Encode.beginObject
        |> Encode.customField "type" encodeChartType chart_.chartType
        |> Encode.customField "data" Chartjs.Internal.Encode.encodeData chart_.data
        |> Encode.customField "options" Chartjs.Internal.Encode.encodeOptions chart_.options
        |> Encode.toValue


encodeChartType : Type -> Encode.Value
encodeChartType chartType =
    (case chartType of
        Bar ->
            "bar"

        HorizontalBar ->
            "horizontalBar"

        Line ->
            "line"

        Doughnut ->
            "doughnut"

        Pie ->
            "pie"
    )
        |> Encode.string

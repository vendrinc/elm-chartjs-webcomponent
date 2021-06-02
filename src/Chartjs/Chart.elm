module Chartjs.Chart exposing
    ( Chart, Type(..), defaultChart
    , setData, setOptions
    , chart
    )

{-| A type-safe bridge to a Chartjs web component.

This library requires both Chart.js and the web component to function properly.
Check the README.md for this package for more detailed instructions on setting up.

@docs Chart, Type, defaultChart

@docs setData, setOptions

@docs chart

-}

import Chartjs.Data as Data
import Chartjs.Internal.Encode
import Chartjs.Internal.Util as Encode
import Chartjs.Options as Options
import Html exposing (Html, node)
import Html.Attributes exposing (property)
import Json.Encode as Encode


{-| Main type helper for a Chartjs chart

Both a Data and an Options object must be specified to help configure this chart.

-}
type alias Chart =
    { chartType : Type
    , data : Data.Data
    , options : Options.Options
    }


{-| Given a chart type, creates a default chart that can then be updated.
-}
defaultChart : Type -> Chart
defaultChart chartType =
    { chartType = chartType
    , data = Data.defaultData
    , options = Options.defaultOptions
    }


{-| Update the data for a chart.
-}
setData : Data.Data -> Chart -> Chart
setData data chart_ =
    { chart_ | data = data }


{-| Update the options for a chart.
-}
setOptions : Options.Options -> Chart -> Chart
setOptions options chart_ =
    { chart_ | options = options }


{-| Basic type for a Chart

For charts containing multiple datasets, both a chart type needs to specified
and a type for each dataset. Default Chart.js parameters will inherit from this type.

-}
type Type
    = Bar
    | HorizontalBar
    | Line
    | Scatter
    | Doughnut
    | Pie
    | Polar
    | Radar


{-| Given attributes and a chart, creates an HTML node using the web component

ChartJs is smart enough to figure out scaling naturally
To set the size of the chart, use CSS styles (either in a stylesheet or using the attributes)

-}
chart : List (Html.Attribute msg) -> Chart -> Html msg
chart attributes chart_ =
    let
        attributesWithConfig =
            (property "chartConfig" <| encodeChart chart_) :: attributes
    in
    node "chart-component" attributesWithConfig []


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

        Scatter ->
            "scatter"

        Doughnut ->
            "doughnut"

        Pie ->
            "pie"

        Polar ->
            "polarArea"

        Radar ->
            "radar"
    )
        |> Encode.string

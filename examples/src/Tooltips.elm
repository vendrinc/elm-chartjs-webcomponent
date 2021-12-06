module Tooltips exposing (example)

import Chartjs.Chart as Chart
import Chartjs.Common as ChartCommon
import Chartjs.Data as ChartData
import Chartjs.DataSets.Bar as BarData
import Chartjs.Options as ChartOptions
import Chartjs.Options.Tooltips as ChartTooltips
import Example exposing (Example)
import Html exposing (Html)
import Utils
import Color exposing (Color)


view : Html msg
view =
    let
        dataset =
            BarData.defaultBarFromData "Example Chart" [ 4, 8, 15, 16, 23, 42 ]
                |> BarData.setBackgroundColor (ChartCommon.All Utils.red)
                |> ChartData.BarData

        data =
            ChartData.dataFromLabels [ "One", "Two", "Three", "Four", "Five", "Six" ]
                |> ChartData.addDataset dataset
    in
    Chart.chart []
        (Chart.defaultChart Chart.Bar
            |> Chart.setData data
            |> Chart.setOptions options
        )

options : ChartOptions.Options
options =
    let
        tooltips =
            ChartTooltips.defaultTooltips
                |> ChartTooltips.setDisplayColors False
                |> ChartTooltips.setBorderColor (Color.red)
                |> ChartTooltips.setBorderWidth 2
                |> ChartTooltips.setCornerRadius 0
                |> ChartTooltips.setTitleMarginBottom 4
                |> ChartTooltips.setTitleAlign ChartTooltips.Center
                |> ChartTooltips.setFooterText "Hello, I'm a footer!"
    in
    ChartOptions.defaultOptions
        |> ChartOptions.setTooltips tooltips

code : String
code =
    """
import Chartjs.Chart as Chart
import Chartjs.Common as ChartCommon
import Chartjs.Data as ChartData
import Chartjs.DataSets.Bar as BarData
import Chartjs.Options as ChartOptions
import Chartjs.Options.Tooltips as ChartTooltips

let
    dataset =
        BarData.defaultBarFromData "Example Chart" [ 4, 8, 15, 16, 23, 42 ]
            |> BarData.setBackgroundColor (ChartCommon.All Utils.red)
            |> ChartData.BarData

    data =
        ChartData.dataFromLabels [ "One", "Two", "Three", "Four", "Five", "Six" ]
            |> ChartData.addDataset dataset

    tooltips =
        ChartTooltips.defaultTooltips
            |> ChartTooltips.setDisplayColors False
            |> ChartTooltips.setBorderColor (Color.red)
            |> ChartTooltips.setBorderWidth 2
            |> ChartTooltips.setCornerRadius 0
            |> ChartTooltips.setTitleMarginBottom 4
            |> ChartTooltips.setTitleAlign ChartTooltips.Center
            |> ChartTooltips.setFooterText "Hello, I'm a footer!"

    options =
        ChartOptions.defaultOptions
            |> ChartOptions.setTooltips tooltips
in
ChartData.defaultChart Chart.Bar
    |> Chart.setOptions options
    |> Chart.setData data
    """


example : Example msg
example =
    { title = "Tooltip Styling"
    , view = view
    , code = code
    }
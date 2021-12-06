module LabelFormatting exposing (example)

import Chartjs.Chart as Chart
import Chartjs.Common as ChartCommon
import Chartjs.Data as ChartData
import Chartjs.DataSets.Line as LineData
import Chartjs.Options as ChartOptions
import Chartjs.Options.Tooltips as ChartTooltips
import Chartjs.Options.Scale as ChartScale
import Example exposing (Example)
import Html exposing (Html)
import Utils


view : Html msg
view =
    let
        dataset =
            LineData.defaultLineFromData "Example Chart" [ 80, 60, 40, 60, 25, 36 ]
                |> LineData.setBackgroundColor (ChartCommon.All Utils.red)
                |> LineData.setBorderColor (ChartCommon.All Utils.red)
                |> ChartData.LineData

        data =
            ChartData.dataFromLabels [ "One", "Two", "Three", "Four", "Five", "Six" ]
                |> ChartData.addDataset dataset
    in
    Chart.chart []
        (Chart.defaultChart Chart.Line
            |> Chart.setData data
            |> Chart.setOptions options
        )

options : ChartOptions.Options
options =
    let
        tooltips =
            ChartTooltips.defaultTooltips
                |> ChartTooltips.setDisplayColors False
                |> ChartTooltips.setLabelSuffix "%"

        scaleX =
            ChartScale.defaultScale ChartScale.Categorical "x"
                |> ChartScale.setTicks (ChartScale.defaultTicks |> ChartScale.setTickPrefix "Category ")

        scaleY =
            ChartScale.defaultScale ChartScale.Linear "y"
                |> ChartScale.setSuggestedMin 0
                |> ChartScale.setSuggestedMax 100
                |> ChartScale.setTicks (ChartScale.defaultTicks |> ChartScale.setTickSuffix "%")
    in
    ChartOptions.defaultOptions
        |> ChartOptions.setTooltips tooltips
        |> ChartOptions.setScales [scaleX, scaleY]

code : String
code =
    """
import Chartjs.Chart as Chart
import Chartjs.Common as ChartCommon
import Chartjs.Data as ChartData
import Chartjs.DataSets.Bar as BarData
import Chartjs.Options as ChartOptions
import Chartjs.Options.Scale as ChartScale
import Chartjs.Options.Tooltips as ChartTooltips

let
    dataset =
        LineData.defaultLineFromData "Example Chart" [ 80, 60, 40, 60, 25, 36 ]
            |> LineData.setBackgroundColor (ChartCommon.All Utils.red)
            |> LineData.setBorderColor (ChartCommon.All Utils.red)
            |> ChartData.LineData

    data =
        ChartData.dataFromLabels [ "One", "Two", "Three", "Four", "Five", "Six" ]
            |> ChartData.addDataset dataset

    tooltips =
        ChartTooltips.defaultTooltips
            |> ChartTooltips.setDisplayColors False
            |> ChartTooltips.setLabelSuffix "%"

    scaleX =
        ChartScale.defaultScale ChartScale.Categorical "x"
            |> ChartScale.setTicks (ChartScale.defaultTicks |> ChartScale.setTickPrefix "Category ")

    scaleY =
        ChartScale.defaultScale ChartScale.Linear "y"
            |> ChartScale.setSuggestedMin 0
            |> ChartScale.setSuggestedMax 100
            |> ChartScale.setTicks (ChartScale.defaultTicks |> ChartScale.setTickSuffix "%")

    options =
        ChartOptions.defaultOptions
            |> ChartOptions.setTooltips tooltips
            |> ChartOptions.setScales [scaleX, scaleY]
in
ChartData.defaultChart Chart.Bar
    |> Chart.setOptions options
    |> Chart.setData data
    """


example : Example msg
example =
    { title = "Label Formatting"
    , view = view
    , code = code
    }
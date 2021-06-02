module PieChartWithOptions exposing (example)

import Chartjs.Chart as Chart
import Chartjs.Common as ChartCommon
import Chartjs.Data as ChartData
import Chartjs.DataSets.DoughnutAndPie as PieData
import Chartjs.Options as ChartOptions
import Chartjs.Options.Font as ChartFont
import Chartjs.Options.Legend as ChartLegend
import Chartjs.Options.Title as ChartTitle
import Color
import Example exposing (Example)
import Html exposing (Html)
import Utils


view : Html msg
view =
    let
        dataset =
            PieData.defaultPieFromData "Example Chart" [ 4, 8, 15, 16, 23, 42 ]
                |> PieData.setBackgroundColor (ChartCommon.PerPoint Utils.defaultColors)
                |> PieData.setOffset (ChartCommon.All 10)
                |> PieData.setCutout 100
                |> ChartData.PieData

        data =
            ChartData.dataFromLabels [ "One", "Two", "Three", "Four", "Five", "Six" ]
                |> ChartData.addDataset dataset

        legendConfig =
            ChartLegend.defaultLegend
                |> ChartLegend.setDisplay True
                |> ChartLegend.setPosition ChartCommon.Left
                |> ChartLegend.setTitle (ChartLegend.defaultTitle "Legend Title")
                |> ChartLegend.setLabels
                    (ChartLegend.defaultLabels
                        |> ChartLegend.setPointStyle ChartCommon.Circle
                        |> ChartLegend.setLabelPadding 10
                    )

        titleConfig =
            ChartTitle.defaultTitle
                |> ChartTitle.setAlign ChartCommon.End
                |> ChartTitle.setPosition ChartCommon.Bottom
                |> ChartTitle.setText "Fancy Title"
                |> ChartTitle.setColor Color.black
                |> ChartTitle.setFont (ChartFont.create "sans-serif" 32)
                |> ChartTitle.setDisplay True

        options =
            ChartOptions.defaultOptions
                |> ChartOptions.setLegend legendConfig
                |> ChartOptions.setTitle titleConfig
    in
    Chart.chart []
        (Chart.defaultChart Chart.Pie
            |> Chart.setOptions options
            |> Chart.setData data
        )


code : String
code =
    """
import Chartjs.Chart as Chart
import Chartjs.Common as ChartCommon
import Chartjs.Data as ChartData
import Chartjs.DataSets.DoughnutAndPie as PieData
import Chartjs.Options as ChartOptions
import Chartjs.Options.Font as ChartFont
import Chartjs.Options.Legend as ChartLegend
import Chartjs.Options.Title as ChartTitle

let
    dataset =
        PieData.defaultPieFromData "Example Chart" model.data
            |> PieData.setBackgroundColor (ChartCommon.PerPoint Utils.defaultColors)
            |> PieData.setOffset (ChartCommon.All 10)
            |> PieData.setCutout 100
    
    data =
        ChartData.dataFromLabels [ "One", "Two", "Three", "Four", "Five", "Six" ]
            |> ChartData.addDataset dataset

    legendConfig =
        ChartLegend.defaultLegend
            |> ChartLegend.setDisplay True
            |> ChartLegend.setPosition ChartCommon.Left
            |> ChartLegend.setTitle (ChartLegend.defaultTitle "Legend Title")
            |> ChartLegend.setLabels
                (ChartLegend.defaultLabels
                    |> ChartLegend.setPointStyle ChartCommon.Circle
                    |> ChartLegend.setLabelPadding 10
                )

    titleConfig =
        ChartTitle.defaultTitle
            |> ChartTitle.setAlign ChartCommon.End
            |> ChartTitle.setPosition ChartCommon.Bottom
            |> ChartTitle.setText "Fancy Title"
            |> ChartTitle.setColor Color.black
            |> ChartTitle.setFont (ChartFont.create "sans-serif" 32)
            |> ChartTitle.setDisplay True

    options =
        ChartOptions.defaultOptions
            |> ChartOptions.setLegend legendConfig
            |> ChartOptions.setTitle titleConfig
in
ChartData.defaultChart Chart.Pie
    |> Chart.setOptions options
    |> Chart.setData data
    """


example : Example msg
example =
    { title = "Pie Chart with Options"
    , view = view
    , code = code
    }

module StackedBarChart exposing (example)

import Chartjs.Chart as Chart
import Chartjs.Common as ChartCommon
import Chartjs.Data as ChartData
import Chartjs.DataSets.Bar as BarData
import Color
import Example exposing (Example)
import Html exposing (Html)
import Utils


view : Html msg
view =
    let
        dataset1 =
            BarData.defaultBarFromData "1A" [ 10, 20, 20, 10, 15 ]
                |> BarData.setBackgroundColor (ChartCommon.All Utils.red)
                |> BarData.setStack "Stack 1"
                |> ChartData.BarData

        dataset2 =
            BarData.defaultBarFromData "1B" [ 5, 15, 10, 10, 15 ]
                |> BarData.setBackgroundColor (ChartCommon.All Utils.blue)
                |> BarData.setStack "Stack 1"
                |> ChartData.BarData

        dataset3 =
            BarData.defaultBarFromData "2" [ 20, 20, 15, 10, 5 ]
                |> BarData.setBackgroundColor (ChartCommon.All Utils.green)
                |> BarData.setStack "Stack 2"
                |> ChartData.BarData

        data =
            ChartData.dataFromLabels [ "Jan", "Feb", "Mar", "Apr", "May" ]
                |> ChartData.setDatasets [ dataset1, dataset2, dataset3 ]
    in
    Chart.chart []
        (Chart.defaultChart Chart.Bar
            |> Chart.setData data
        )


code : String
code =
    """
let
    dataset1 =
        BarData.defaultBarFromData "1A" [ 10, 20, 20, 10, 15 ]
            |> BarData.setBackgroundColor (ChartCommon.All Utils.red)
            |> BarData.setStack "Stack 1"
            |> ChartData.BarData

    dataset2 =
        BarData.defaultBarFromData "1B" [ 5, 15, 10, 10, 15 ]
            |> BarData.setBackgroundColor (ChartCommon.All Utils.blue)
            |> BarData.setStack "Stack 1"
            |> ChartData.BarData

    dataset3 =
        BarData.defaultBarFromData "2" [ 20, 20, 15, 10, 5 ]
            |> BarData.setBackgroundColor (ChartCommon.All Utils.green)
            |> BarData.setStack "Stack 2"
            |> ChartData.BarData

    data =
        ChartData.dataFromLabels [ "Jan", "Feb", "Mar", "Apr", "May" ]
            |> ChartData.setDatasets [ dataset1, dataset2, dataset3 ]
in
Chart.chart []
    (Chart.defaultChart Chart.Bar
        |> Chart.setData data
    )
    """


example : Example msg
example =
    { title = "Stacked Bar Chart"
    , view = view
    , code = code
    }

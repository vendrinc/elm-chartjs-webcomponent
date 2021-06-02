module MixedChart exposing (example)

import Chartjs.Chart as Chart
import Chartjs.Common as ChartCommon
import Chartjs.Data as ChartData
import Chartjs.DataSets.Bar as BarData
import Chartjs.DataSets.Line as LineData
import Example exposing (Example)
import Html exposing (Html)
import Utils


view : Html msg
view =
    let
        dataset1 =
            BarData.defaultBarFromData "Bar One" [ 10, 20, 20, 10, 15 ]
                |> BarData.setBackgroundColor (ChartCommon.All Utils.red)
                |> ChartData.BarData

        dataset2 =
            BarData.defaultBarFromData "Bar Two" [ 5, 15, 10, 10, 15 ]
                |> BarData.setBackgroundColor (ChartCommon.All Utils.blue)
                |> ChartData.BarData

        dataset3 =
            LineData.defaultLineFromData "The Line" [ 10, 15, 12, 12, 18 ]
                |> LineData.setBorderColor (ChartCommon.All Utils.green)
                |> LineData.setBackgroundColor (ChartCommon.All Utils.green)
                |> ChartData.LineData

        data =
            ChartData.dataFromLabels [ "Jan", "Feb", "Mar", "Apr", "May" ]
                |> ChartData.setDatasets [ dataset3, dataset2, dataset1 ]
    in
    Chart.chart []
        (Chart.defaultChart Chart.Bar
            |> Chart.setData data
        )


code : String
code =
    """
import Chartjs.Chart as Chart
import Chartjs.Common as ChartCommon
import Chartjs.Data as ChartData
import Chartjs.DataSets.Bar as BarData
import Chartjs.DataSets.Line as LineData

let
    dataset1 =
        BarData.defaultBarFromData "Bar One" [ 10, 20, 20, 10, 15 ]
            |> BarData.setBackgroundColor (ChartCommon.All Utils.red)
            |> ChartData.BarData

    dataset2 =
        BarData.defaultBarFromData "Bar Two" [ 5, 15, 10, 10, 15 ]
            |> BarData.setBackgroundColor (ChartCommon.All Utils.blue)
            |> ChartData.BarData

    dataset3 =
        LineData.defaultLineFromData "The Line" [ 10, 15, 12, 12, 18 ]
            |> LineData.setBorderColor (ChartCommon.All Utils.green)
            |> LineData.setBackgroundColor (ChartCommon.All Utils.green)
            |> ChartData.LineData

    data =
        ChartData.dataFromLabels [ "Jan", "Feb", "Mar", "Apr", "May" ]
            |> ChartData.setDatasets [ dataset1, dataset2, dataset3 ]
in
ChartData.defaultChart Chart.Bar
    |> Chart.setData data
    """


example : Example msg
example =
    { title = "Mixed Chart"
    , view = view
    , code = code
    }

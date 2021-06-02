module SimpleBarChart exposing (example)

import Chartjs.Chart as Chart
import Chartjs.Common as ChartCommon
import Chartjs.Data as ChartData
import Chartjs.DataSets.Bar as BarData
import Example exposing (Example)
import Html exposing (Html, div)
import Utils


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
        )


code : String
code =
    """
import Chartjs.Chart as Chart
import Chartjs.Common as ChartCommon
import Chartjs.Data as ChartData
import Chartjs.DataSets.Bar as BarData


let
    dataset =
        BarData.defaultBarFromData "Example Chart" [ 4, 8, 15, 16, 23, 42 ]
            |> BarData.setBackgroundColor (ChartCommon.All Utils.red)
            |> ChartData.BarData
    
    data =
        ChartData.dataFromLabels [ "One", "Two", "Three", "Four", "Five", "Six"]
            |> ChartData.addDataset dataset
in
ChartData.defaultChart Chart.Bar
    |> Chart.setData data
    """


example : Example msg
example =
    { title = "Simple Bar Chart"
    , view = view
    , code = code
    }

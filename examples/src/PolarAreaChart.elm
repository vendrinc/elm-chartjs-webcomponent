module PolarAreaChart exposing (example)

import Chartjs.Chart as Chart
import Chartjs.Common as ChartCommon
import Chartjs.Data as ChartData
import Chartjs.DataSets.Polar as PolarData
import Color
import Example exposing (Example)
import Html exposing (Html)
import Utils


view : Html msg
view =
    let
        dataset =
            PolarData.defaultPolarFromData "Example Chart" [ 4, 8, 15, 16, 23, 42 ]
                |> PolarData.setBackgroundColor (ChartCommon.PerPoint Utils.defaultColors)
                |> ChartData.PolarData

        data =
            ChartData.dataFromLabels [ "One", "Two", "Three", "Four", "Five", "Six" ]
                |> ChartData.addDataset dataset
    in
    Chart.chart []
        (Chart.defaultChart Chart.Polar
            |> Chart.setData data
        )


code : String
code =
    """
let
    dataset =
        PolarData.defaultPolarFromData "Example Chart" [ 4, 8, 15, 16, 23, 42 ]
            |> PolarData.setBackgroundColor (ChartCommon.PerPoint Utils.defaultColors)
            |> ChartData.PolarData

    data =
        ChartData.dataFromLabels [ "One", "Two", "Three", "Four", "Five", "Six" ]
            |> ChartData.addDataset dataset
in
ChartData.defaultChart Chart.Polar
    |> Chart.setData data
    """


example : Example msg
example =
    { title = "Polar Area Chart"
    , view = view
    , code = code
    }

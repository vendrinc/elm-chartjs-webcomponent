module PolarAreaChart exposing (example)

import Chartjs.Chart as Chart
import Chartjs.Common as ChartCommon
import Chartjs.Data as ChartData
import Chartjs.DataSets.Polar as PolarData
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
    """


example : Example msg
example =
    { title = "Polar Area Chart"
    , view = view
    , code = code
    }

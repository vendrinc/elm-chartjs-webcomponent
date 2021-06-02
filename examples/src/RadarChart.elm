module RadarChart exposing (example)

import Chartjs.Chart as Chart
import Chartjs.Common as ChartCommon
import Chartjs.Data as ChartData
import Chartjs.DataSets.Line as LineData
import Color
import Example exposing (Example)
import Html exposing (Html)
import Utils


view : Html msg
view =
    let
        dataset =
            LineData.defaultRadarFromData "Attributes" [ 8, 9, 12, 12, 15, 11 ]
                |> LineData.setBackgroundColor (ChartCommon.All Utils.blue)
                |> ChartData.LineData

        data =
            ChartData.dataFromLabels [ "Strength", "Constitution", "Dexterity", "Intelligence", "Wisdom", "Charisma" ]
                |> ChartData.addDataset dataset
    in
    Chart.chart []
        (Chart.defaultChart Chart.Radar
            |> Chart.setData data
        )


code : String
code =
    """
    let
        dataset =
            LineData.defaultRadarFromData "Attributes" [ 8, 9, 12, 12, 15, 11 ]
                |> LineData.setBackgroundColor (ChartCommon.All Utils.blue)
                |> ChartData.LineData

        data =
            ChartData.dataFromLabels [ "Strength", "Constitution", "Dexterity", "Intelligence", "Wisdom", "Charisma" ]
                |> ChartData.addDataset dataset
    in
    Chart.defaultChart Chart.Radar
        |> Chart.setData data
    """


example : Example msg
example =
    { title = "Radar Chart"
    , view = view
    , code = code
    }

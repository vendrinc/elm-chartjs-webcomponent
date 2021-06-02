module ScatterChart exposing (example)

import Chartjs.Chart as Chart
import Chartjs.Common as ChartCommon
import Chartjs.Data as ChartData
import Chartjs.DataSets.Line as LineData
import Chartjs.Options as ChartOptions
import Chartjs.Options.Scale as ChartScale
import Color
import Example exposing (Example)
import Html exposing (Html)
import Utils


view : Html msg
view =
    let
        points =
            [ ( 4, 10 ), ( 5, 12 ), ( 6, 8 ), ( 3, 80 ), ( 4, 50 ), ( 5, 72 ), ( 1.5, 4 ) ]

        dataset =
            LineData.defaultLineFromPointData "Scatter Points" points
                |> LineData.setBackgroundColor (ChartCommon.All Utils.red)
                |> LineData.setShowLine False
                |> LineData.setPointStyle (ChartCommon.All ChartCommon.RectRounded)
                |> LineData.setPointRadius (ChartCommon.All 8)
                |> LineData.setPointHoverRadius (ChartCommon.All 12)
                |> ChartData.LineData

        data =
            ChartData.defaultData
                |> ChartData.addDataset dataset

        xGrid =
            ChartScale.defaultGrid
                |> ChartScale.setBorderWidth 2
                |> ChartScale.setGridColor Color.black

        xAxis =
            ChartScale.defaultScale ChartScale.Linear "x"
                |> ChartScale.setMin 0
                |> ChartScale.setMax 10
                |> ChartScale.setGrid xGrid
                |> ChartScale.setTitle (ChartScale.defaultTitle "X Axis (Linear)")

        yAxis =
            ChartScale.defaultScale ChartScale.Logarithmic "y"
                |> ChartScale.setMax 100
                |> ChartScale.setTitle (ChartScale.defaultTitle "Y Axis (Logarithmic)")

        options =
            ChartOptions.defaultOptions
                |> ChartOptions.addScale xAxis
                |> ChartOptions.addScale yAxis
    in
    Chart.chart []
        (Chart.defaultChart Chart.Scatter
            |> Chart.setData data
            |> Chart.setOptions options
        )


code : String
code =
    """
let
    points =
        [ ( 4, 10 ), ( 5, 12 ), ( 6, 8 ), ( 3, 80 ), ( 4, 50 ), ( 5, 72 ), ( 1.5, 4 ) ]

    dataset =
        LineData.defaultLineFromPointData "Scatter Points" points
            |> LineData.setBackgroundColor (ChartCommon.All Utils.red)
            |> LineData.setShowLine False
            |> LineData.setPointStyle (ChartCommon.All ChartCommon.RectRounded)
            |> LineData.setPointRadius (ChartCommon.All 8)
            |> LineData.setPointHoverRadius (ChartCommon.All 12)
            |> ChartData.LineData

    data =
        ChartData.defaultData
            |> ChartData.addDataset dataset

    xGrid =
        ChartScale.defaultGrid
            |> ChartScale.setBorderWidth 2
            |> ChartScale.setGridColor Color.black

    xAxis =
        ChartScale.defaultScale ChartScale.Linear "x"
            |> ChartScale.setMin 0
            |> ChartScale.setMax 10
            |> ChartScale.setGrid xGrid
            |> ChartScale.setTitle (ChartScale.defaultTitle "X Axis (Linear)")

    yAxis =
        ChartScale.defaultScale ChartScale.Logarithmic "y"
            |> ChartScale.setMax 100
            |> ChartScale.setTitle (ChartScale.defaultTitle "Y Axis (Logarithmic)")
   
    options =
        ChartOptions.defaultOptions
            |> ChartOptions.addScale xAxis
            |> ChartOptions.addScale yAxis
in
Chart.defaultChart Chart.Scatter
    |> Chart.setData data
    |> Chart.setOptions options
    """


example : Example msg
example =
    { title = "Scatter Chart"
    , view = view
    , code = code
    }

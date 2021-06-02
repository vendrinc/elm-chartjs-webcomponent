module MultipleAxes exposing (example)

import Browser
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


buildDataset : List ( Float, Float ) -> String -> Color.Color -> ChartData.DataSet
buildDataset dataset yAxisId color =
    LineData.defaultLineFromPointData "Example Chart" dataset
        |> LineData.setBackgroundColor (ChartCommon.All color)
        |> LineData.setShowLine False
        |> LineData.setPointStyle (ChartCommon.All ChartCommon.RectRounded)
        |> LineData.setPointRadius (ChartCommon.All 8)
        |> LineData.setPointHoverRadius (ChartCommon.All 12)
        |> LineData.setYAxisID yAxisId
        |> ChartData.LineData


options : ChartOptions.Options
options =
    let
        xGrid =
            ChartScale.defaultGrid
                |> ChartScale.setBorderWidth 2
                |> ChartScale.setGridColor Color.black

        xAxis =
            ChartScale.defaultScale ChartScale.Linear "x"
                |> ChartScale.setMin 0
                |> ChartScale.setMax 10
                |> ChartScale.setGrid xGrid
                |> ChartScale.setTitle (ChartScale.defaultTitle "X AXIS TITLE")

        yAxisLeft =
            ChartScale.defaultScale ChartScale.Linear "y1"
                |> ChartScale.setSuggestedMin 0
                |> ChartScale.setMax 100
                |> ChartScale.setPosition ChartCommon.Left
                |> ChartScale.setTitle (ChartScale.defaultTitle "Axis on the Left")
                |> ChartScale.setTicks (ChartScale.defaultTicks |> ChartScale.setTickTextColor Utils.red)

        yAxisRight =
            ChartScale.defaultScale ChartScale.Linear "y2"
                |> ChartScale.setSuggestedMin 0
                |> ChartScale.setMax 50
                |> ChartScale.setPosition ChartCommon.Right
                |> ChartScale.setTitle (ChartScale.defaultTitle "Axis on the Right")
                |> ChartScale.setTicks (ChartScale.defaultTicks |> ChartScale.setTickTextColor Utils.blue)
                |> ChartScale.setGrid (ChartScale.defaultGrid |> ChartScale.setDrawOnChartArea False)
    in
    ChartOptions.defaultOptions
        |> ChartOptions.addScale xAxis
        |> ChartOptions.addScale yAxisLeft
        |> ChartOptions.addScale yAxisRight


chart : Chart.Chart
chart =
    let
        data1 =
            [ ( 4, 10 ), ( 5, 12 ), ( 6, 8 ), ( 3, 15 ), ( 4, 50 ), ( 5, 72 ), ( 1.5, 4 ) ]

        data2 =
            [ ( 8, 48 ), ( 7, 32 ), ( 4, 12 ), ( 2.5, 25 ), ( 4, 34 ), ( 5.25, 16 ), ( 1.5, 9 ) ]
    in
    Chart.defaultChart Chart.Scatter
        |> Chart.setOptions options
        |> Chart.setData
            (ChartData.defaultData
                |> ChartData.addDataset (buildDataset data1 "y1" Utils.red)
                |> ChartData.addDataset (buildDataset data2 "y2" Utils.blue)
            )


view : Html msg
view =
    Chart.chart [] chart


code : String
code =
    """
buildDataset : List ( Float, Float ) -> String -> Color.Color -> ChartData.DataSet
buildDataset dataset yAxisId color =
    LineData.defaultLineFromPointData "Example Chart" dataset
        |> LineData.setBackgroundColor (ChartCommon.All color)
        |> LineData.setShowLine False
        |> LineData.setPointStyle (ChartCommon.All ChartCommon.RectRounded)
        |> LineData.setPointRadius (ChartCommon.All 8)
        |> LineData.setPointHoverRadius (ChartCommon.All 12)
        |> LineData.setYAxisID yAxisId
        |> ChartData.LineData


options : ChartOptions.Options
options =
    let
        xGrid =
            ChartScale.defaultGrid
                |> ChartScale.setBorderWidth 2
                |> ChartScale.setGridColor Color.black

        xAxis =
            ChartScale.defaultScale ChartScale.Linear "x"
                |> ChartScale.setMin 0
                |> ChartScale.setMax 10
                |> ChartScale.setGrid xGrid
                |> ChartScale.setTitle (ChartScale.defaultTitle "X AXIS TITLE")

        yAxisLeft =
            ChartScale.defaultScale ChartScale.Linear "y1"
                |> ChartScale.setSuggestedMin 0
                |> ChartScale.setMax 100
                |> ChartScale.setPosition ChartCommon.Left
                |> ChartScale.setTitle (ChartScale.defaultTitle "Axis on the Left")
                |> ChartScale.setTicks (ChartScale.defaultTicks |> ChartScale.setTickTextColor Utils.red)

        yAxisRight =
            ChartScale.defaultScale ChartScale.Linear "y2"
                |> ChartScale.setSuggestedMin 0
                |> ChartScale.setMax 50
                |> ChartScale.setPosition ChartCommon.Right
                |> ChartScale.setTitle (ChartScale.defaultTitle "Axis on the Right")
                |> ChartScale.setTicks (ChartScale.defaultTicks |> ChartScale.setTickTextColor Utils.blue)
                |> ChartScale.setGrid (ChartScale.defaultGrid |> ChartScale.setDrawOnChartArea False)
    in
    ChartOptions.defaultOptions
        |> ChartOptions.addScale xAxis
        |> ChartOptions.addScale yAxisLeft
        |> ChartOptions.addScale yAxisRight


chart : Chart.Chart
chart =
    let
        data1 =
            [ ( 4, 10 ), ( 5, 12 ), ( 6, 8 ), ( 3, 15 ), ( 4, 50 ), ( 5, 72 ), ( 1.5, 4 ) ]

        data2 =
            [ ( 8, 48 ), ( 7, 32 ), ( 4, 12 ), ( 2.5, 25 ), ( 4, 34 ), ( 5.25, 16 ), ( 1.5, 9 ) ]
    in
    Chart.defaultChart Chart.Scatter
        |> Chart.setOptions options
        |> Chart.setData
            (ChartData.defaultData
                |> ChartData.addDataset (buildDataset data1 "y1" Utils.red)
                |> ChartData.addDataset (buildDataset data2 "y2" Utils.blue)
            )
    """


example : Example msg
example =
    { title = "Multiple Axes"
    , view = view
    , code = code
    }

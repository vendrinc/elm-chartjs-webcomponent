module PieChartWithOptions exposing (main)

import Browser
import Chartjs.Chart as Chart
import Chartjs.Common as ChartCommon
import Chartjs.Data as ChartData
import Chartjs.Options as ChartOptions
import Chartjs.Options.Legend as ChartLegend
import Chartjs.Options.Title as ChartTitle
import Chartjs.Options.Font as ChartFont
import Chartjs.DataSets.DoughnutAndPie as PieData
import Color
import Html exposing (Html, div)


{-| Our model keeps track of some basic chart information
This isn't super important right now, but it will be useful when updating the chart later
-}
type alias Model =
    { data : List Float
    , labels : List String
    }

{-| Initialise the model with some basic data and examples
-}
init : Model
init =
    { data = [ 4, 8, 15, 16, 23, 42 ]
    , labels = [ "One", "Two", "Three", "Four", "Five", "Six" ]
    }


{-| Build a Chartjs data object from our model
First we need a Data container which has some basic chart information
Then we need to make the dataset for our bar chart
This can be done easily using pipe operators instead of record update syntax
-}
data : Model -> ChartData.Data
data model =
    let 
        dataset =
            PieData.defaultPieFromData "Example Chart" model.data
                |> PieData.setBackgroundColor (ChartCommon.PerPoint ChartCommon.defaultColors)
                |> PieData.setOffset (ChartCommon.All 10)
                |> PieData.setCutout 100
    in
    ChartData.dataFromLabels model.labels
        |> ChartData.addDataset (ChartData.PieData dataset)

legendConfig : ChartLegend.Legend
legendConfig =
    ChartLegend.defaultLegend
        |> ChartLegend.setDisplay True
        |> ChartLegend.setPosition ChartCommon.Left

titleConfig : ChartTitle.Title
titleConfig =
    ChartTitle.defaultTitle
        |> ChartTitle.setAlign ChartCommon.End
        |> ChartTitle.setPosition ChartCommon.Bottom
        |> ChartTitle.setText "Fancy Title"
        |> ChartTitle.setColor Color.black
        |> ChartTitle.setFont (ChartFont.create "sans-serif" 32)
        |> ChartTitle.setDisplay True

chartOptions : ChartOptions.Options
chartOptions =
    ChartOptions.defaultOptions
        |> ChartOptions.setLegend legendConfig
        |> ChartOptions.setTitle titleConfig

{-| Build the full chart configuration from our model
-}
chartConfig : Model -> Chart.Chart
chartConfig model =
    Chart.defaultChart Chart.Pie
        |> Chart.setData (data model)
        |> Chart.setOptions chartOptions


{-| Display the chart using the chart config
If we wanted to resize the chart or add other attributes, we can do that here
-}
view : Model -> Html msg
view model =
    Chart.chart [] (chartConfig model)


{-| There's nothing to update in this example, so this is a dummy update function
-}
update : Model -> msg -> Model
update model _ =
    model


{-| Simple browser sandbox to run this example
-}
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }
module ScatterChart exposing (main)

import Browser
import Chartjs.Chart as Chart
import Chartjs.Common as ChartCommon
import Chartjs.Data as ChartData
import Chartjs.Options as ChartOptions
import Chartjs.Options.Scale as ChartScale
import Chartjs.DataSets.Line as LineData
import Color
import Html exposing (Html, div)
import Utils

type alias Model =
    { data : List (Float, Float)
    }

{-| Initialise the model with some scatter data
-}
init : Model
init =
    { data = [ (4, 10), (5, 12), (6, 8) ]
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
            LineData.defaultLineFromPointData "Example Chart" model.data
                |> LineData.setBackgroundColor (ChartCommon.All Utils.red)
                |> ChartData.LineData
    in
    ChartData.defaultData
        |> ChartData.addDataset dataset

options : ChartOptions.Options
options =
    let
        xAxis =
            ChartScale.defaultScale ChartScale.Linear "x"
    in
    ChartOptions.defaultOptions
        |> ChartOptions.addScale xAxis

{-| Build the full chart configuration from our model
Right now, we're only setting custom data up
When we have more complicated chart options, we'd add it to the config here
-}
chartConfig : Model -> Chart.Chart
chartConfig model =
    Chart.defaultChart Chart.Scatter
        |> Chart.setData (data model)


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
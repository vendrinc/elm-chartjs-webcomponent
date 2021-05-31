module SimpleBarChart exposing (main)

import Browser
import Chartjs.Chart as Chart
import Chartjs.Common as ChartCommon
import Chartjs.Data as ChartData
import Chartjs.DataSets.Bar as BarData
import Color
import Html exposing (Html, div)


{-| Our model keeps track of some basic chart information
This isn't super important right now, but it will be useful when updating the chart later
-}
type alias Model =
    { data : List Float
    , labels : List String
    , color : Color.Color
    }

{-| Initialise the model with some basic data and examples
-}
init : Model
init =
    { data = [ 4, 8, 15, 16, 23, 42 ]
    , labels = [ "One", "Two", "Three", "Four", "Five", "Six" ]
    , color = Color.red
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
            BarData.defaultBarFromData "Example Chart" model.data
                |> BarData.setBackgroundColor (ChartCommon.All model.color)
    in
    ChartData.dataFromLabels model.labels
        |> ChartData.addDataset (ChartData.BarData dataset)


{-| Build the full chart configuration from our model
Right now, we're only setting custom data up
When we have more complicated chart options, we'd add it to the config here
-}
chartConfig : Model -> Chart.Chart
chartConfig model =
    Chart.defaultChart Chart.Bar
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
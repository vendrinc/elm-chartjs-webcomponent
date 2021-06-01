module MixedChart exposing (main)

import Browser
import Chartjs.Chart as Chart
import Chartjs.Common as ChartCommon
import Chartjs.Data as ChartData
import Chartjs.DataSets.Bar as BarData
import Chartjs.DataSets.Line as LineData
import Color
import Html exposing (Html, div)
import Utils


type alias Model =
    { data1 : List Float
    , data2 : List Float
    , data3 : List Float
    , labels : List String
    }


init : Model
init =
    { data1 = [ 10, 20, 20, 10, 15 ]
    , data2 = [ 5, 15, 10, 10, 15 ]
    , data3 = [ 10, 15, 12, 12, 18 ]
    , labels = [ "Jan", "Feb", "Mar", "Apr", "May" ]
    }


{-| Build a Chartjs data object from our model
First we need a Data container which has some basic chart information
Then we need to make the dataset for our bar chart
This can be done easily using pipe operators instead of record update syntax
-}
data : Model -> ChartData.Data
data model =
    let
        dataset1 =
            BarData.defaultBarFromData "Bar One" model.data1
                |> BarData.setBackgroundColor (ChartCommon.All Utils.red)
                |> ChartData.BarData

        dataset2 =
            BarData.defaultBarFromData "Bar Two" model.data2
                |> BarData.setBackgroundColor (ChartCommon.All Utils.blue)
                |> ChartData.BarData

        dataset3 =
            LineData.defaultLineFromData "The Line" model.data3
                |> LineData.setBorderColor (ChartCommon.All Utils.green)
                |> LineData.setBackgroundColor (ChartCommon.All Utils.green)
                |> ChartData.LineData
    in
    ChartData.dataFromLabels model.labels
        |> ChartData.setDatasets [ dataset3, dataset1, dataset2 ]


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

module UpdatingLineChart exposing (main)

import Browser
import Chartjs.Chart as Chart
import Chartjs.Common as Common
import Chartjs.Data as Data
import Chartjs.DataSets.Line as LineData
import Color
import Html exposing (Html, div)
import Random
import Task
import Time


{-| Keep track of basic chart information in our model
We'll be updating the data this time round, but the labels and color will still be static
-}
type alias Model =
    { data : List Float
    , labels : List String
    , color : Color.Color
    }


{-| Messages we'll use for handling our data
We have a subscription later that'll run the Tick event every so often
The random generator will use NewData to send the new data back to us
-}
type Msg
    = Tick Time.Posix
    | NewData (List Float)


{-| Initialise the model with some labels and the color
Then, request the first set of randomly generated data
-}
init : () -> ( Model, Cmd Msg )
init _ =
    let
        defaultModel =
            { data = []
            , labels = [ "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" ]
            , color = Color.blue
            }
    in
    ( defaultModel, Random.generate NewData randomData )


{-| Random generator for the data
This isn't important for the example - you can use whatever data source you want
-}
randomData : Random.Generator (List Float)
randomData =
    Random.list 12 (Random.float 1 20)


{-| Turn the model into a Chartjs dataset object
-}
data : Model -> Data.Data
data model =
    Data.buildData model.labels
        |> Data.addDataset LineData
            (LineData.defaultLineFromData "Example Chart" model.data
                |> LineData.setBorderColor (Common.All model.color)
                |> LineData.setShowLine False
            )


{-| Build a chart config from our model
-}
chartConfig : Model -> Chart.Chart
chartConfig model =
    Chart.defaultChart Chart.Line
        |> Chart.setData (data model)


{-| Display the chart with the appropiate settings from our model

Notice that we don't need any fancy update handlers!
Once the model updates, the rest of the data will be passed along to the web component
Over there, the web component handles the ChartJs side of things and plays a smooth animation for us

-}
view : Model -> Html msg
view model =
    Chart.chart [] (chartConfig model)


{-| Our update function updates the data periodically

For this example, we're using a random generator to randomly make the data up
It doesn't matter where the data comes from! So long as the model gets updated, the charts will work smoothly

-}
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Tick _ ->
            ( model, Random.generate NewData randomData )

        NewData d ->
            ( { model | data = d }, Cmd.none )


{-| Use the Time module to send a "Tick" message every two seconds
-}
subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every 2000 Tick


{-| We need to use subscriptions this time,
so we use Browser.element instead of Browser.sandbox
-}
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }

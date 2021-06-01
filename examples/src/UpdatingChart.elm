module UpdatingChart exposing (main)

import Browser
import Chartjs.Chart as Chart
import Chartjs.Common as ChartCommon
import Chartjs.Data as ChartData
import Chartjs.DataSets.Line as LineData
import Color exposing (Color)
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Random
import List.Extra
import Utils

type alias Model =
    { datasets : List (List Float)
    }

init : () -> ( Model, Cmd Msg )
init _ =
    let
        defaultModel =
            { datasets = [[]]
            }
    in
    ( defaultModel, Random.generate RandomizedData (randomDatasets 2) )

chartLabels : List String
chartLabels =
    [ "One", "Two", "Three", "Four", "Five", "Six" ]

datasetTitles : List String
datasetTitles =
    [ "Red", "Orange", "Yellow", "Green", "Blue", "Purple", "Gray" ]


buildDataset : List Float -> String -> Color -> ChartData.DataSet
buildDataset dataset title color =
    LineData.defaultLineFromData title dataset
        |> LineData.setBorderColor (ChartCommon.All color)
        |> LineData.setBackgroundColor (ChartCommon.All color)
        |> LineData.setLineTension 0.2
        |> ChartData.LineData


chartData : Model -> ChartData.Data
chartData model =
    let
        -- Use cycle to allow for as many datasets as we need
        titles =
            List.Extra.cycle (List.length model.datasets) datasetTitles

        colors =
            List.Extra.cycle (List.length model.datasets) Utils.defaultColors
        
        datasets =
            List.map3 buildDataset (List.reverse model.datasets) titles colors
    in
    ChartData.dataFromLabels chartLabels
        |> ChartData.setDatasets datasets

chartConfig : Model -> Chart.Chart
chartConfig model =
    Chart.defaultChart Chart.Line
        |> Chart.setData (chartData model)

type Msg
    = Randomize
    | AddDataset
    | RemoveDataset
    | RandomizedData (List (List Float))
    | AddRandomDataset (List Float)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Randomize ->
            let
                generator =
                    randomDatasets (List.length model.datasets)
            in
            ( model, Random.generate RandomizedData generator )

        AddDataset ->
            ( model, Random.generate AddRandomDataset randomDataset )

        RemoveDataset ->
            let
                newDatasets =
                    case model.datasets of
                        [] -> 
                            []
                            
                        x :: xs ->
                            xs
            in
            ( { model | datasets = newDatasets }, Cmd.none )

        RandomizedData newData ->
            ( { model | datasets = newData }, Cmd.none )

        AddRandomDataset newDataset ->
            let
                newDatasets =
                    newDataset :: model.datasets
            in
            ( { model | datasets = newDatasets}, Cmd.none )

randomDatasets : Int -> Random.Generator (List (List Float))
randomDatasets numDatasets =
    Random.list numDatasets (randomDataset)

randomDataset : Random.Generator (List Float)
randomDataset =
    Random.list 10 (Random.float 1 20)

view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Randomize ] [ text "Randomize Data" ]
        , button [ onClick AddDataset ] [ text "Add Dataset" ]
        , button [ onClick RemoveDataset ] [ text "Remove Dataset" ]
        , Chart.chart [] (chartConfig model)
        ]

main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = (\_ -> Sub.none)
        }
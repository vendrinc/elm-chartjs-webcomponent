module Main exposing (main)

import Browser
import Example
import Html
import Html.Attributes as HtmlAttributes
import Html.Events as HtmlEvents
import Html.Keyed as HtmlKeyed
import MixedChart
import MultipleAxes
import PieChartWithOptions
import ScatterChart
import SimpleBarChart
import StackedBarChart


examplesList : List (Example.Example Msg)
examplesList =
    [ SimpleBarChart.example
    , StackedBarChart.example
    , MixedChart.example
    , PieChartWithOptions.example
    , ScatterChart.example
    , MultipleAxes.example
    ]


init : Example.Example Msg
init =
    SimpleBarChart.example


type Msg
    = UpdateExample (Example.Example Msg)


update : Msg -> Example.Example Msg -> Example.Example Msg
update msg _ =
    case msg of
        UpdateExample e ->
            e


view : Example.Example Msg -> Html.Html Msg
view example =
    Html.div []
        [ viewHeader
        , Html.div [ HtmlAttributes.class "container" ]
            [ viewExample example
            , viewSidebar example
            ]
        ]


viewHeader : Html.Html Msg
viewHeader =
    Html.header []
        [ Html.h1 [] [ Html.text "elm-chartjs-webcomponent examples" ]
        ]


viewSidebar : Example.Example Msg -> Html.Html Msg
viewSidebar selected =
    Html.nav [ HtmlAttributes.id "sidebar" ] <|
        [ Html.h2 [] [ Html.text "Examples" ] ]
            ++ List.map (viewExampleButton selected) examplesList


viewExampleButton : Example.Example Msg -> Example.Example Msg -> Html.Html Msg
viewExampleButton selected example =
    let
        attributes =
            if example == selected then
                [ HtmlAttributes.class "selected", HtmlEvents.onClick (UpdateExample example) ]

            else
                [ HtmlEvents.onClick (UpdateExample example) ]
    in
    Html.button attributes [ Html.text example.title ]


viewExample : Example.Example Msg -> Html.Html Msg
viewExample example =
    Html.div [ HtmlAttributes.id "example-container" ]
        [ Html.h1 [] [ Html.text example.title ]
        , HtmlKeyed.node "div" [] [ ( example.title, example.view ) ]
        , viewExampleCode example.code
        ]


viewExampleCode : String -> Html.Html Msg
viewExampleCode code =
    Html.pre []
        [ Html.code []
            [ Html.text code
            ]
        ]


main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }

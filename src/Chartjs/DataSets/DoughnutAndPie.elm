module Chartjs.DataSets.DoughnutAndPie exposing (DataSet, defaultBarFromLabel, encodeDoughnutAndPieDataSet)

import Color exposing (Color)
import Json.Encode as Encode
import Chartjs.Common as Common
import Chartjs.Util as Encode

type alias DataSet =
    { label : String
    , -- The label for the dataset which appears in the legend and tooltips.
      data : List Float
    , backgroundColor : Maybe (Common.PointProperty Color)
    , -- The fill color of the arcs in the dataset.
      borderColor : Maybe (Common.PointProperty Color)
    , -- The border color of the arcs in the dataset.
      borderWidth : Maybe (Common.PointProperty Float)
    , -- The border width of the arcs in the dataset.
      hoverBackgroundColor : Maybe (Common.PointProperty Color)
    , -- The fill colour of the arcs when hovered.
      hoverBorderColor : Maybe (Common.PointProperty Color)
    , -- The stroke colour of the arcs when hovered.
      hoverBorderWidth : Maybe (Common.PointProperty Float)
    , -- The stroke width of the arcs when hovered.
      cutoutPercentage : Maybe Int
    , -- The percentage of the chart that is cut out of the middle.
      rotation : Maybe Int
    , -- Starting angle to draw arcs from.
      circumference : Maybe Int -- Sweep to allow arcs to cover
    }


defaultBarFromLabel : String -> DataSet
defaultBarFromLabel label =
    { label = label
    , data = []
    , backgroundColor = Nothing
    , borderColor = Nothing
    , borderWidth = Nothing
    , hoverBackgroundColor = Nothing
    , hoverBorderColor = Nothing
    , hoverBorderWidth = Nothing
    , cutoutPercentage = Nothing
    , rotation = Nothing
    , circumference = Nothing
    }


encodeDoughnutAndPieDataSet : DataSet -> Encode.Value
encodeDoughnutAndPieDataSet barChartDataSet =
    Encode.beginObject
        |> Encode.stringField "label" barChartDataSet.label
        |> Encode.listField "data" Encode.float barChartDataSet.data
        |> Encode.maybeCustomField "backgroundColor" (Common.encodePointProperty Encode.encodeColor) barChartDataSet.backgroundColor
        |> Encode.maybeCustomField "borderColor" (Common.encodePointProperty Encode.encodeColor) barChartDataSet.borderColor
        |> Encode.maybeCustomField "borderWidth" (Common.encodePointProperty Encode.float) barChartDataSet.borderWidth
        |> Encode.maybeCustomField "hoverBackgroundColor" (Common.encodePointProperty Encode.encodeColor) barChartDataSet.hoverBackgroundColor
        |> Encode.maybeCustomField "hoverBorderColor" (Common.encodePointProperty Encode.encodeColor) barChartDataSet.hoverBorderColor
        |> Encode.maybeCustomField "hoverBorderWidth" (Common.encodePointProperty Encode.float) barChartDataSet.hoverBorderWidth
        |> Encode.maybeIntField "cutoutPercentage" barChartDataSet.cutoutPercentage
        |> Encode.maybeIntField "rotation" barChartDataSet.rotation
        |> Encode.maybeIntField "circumference" barChartDataSet.circumference
        |> Encode.toValue

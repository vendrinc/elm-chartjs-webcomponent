module Chartjs.DataSets.DoughnutAndPie exposing (DataSet, defaultPieFromData, defaultPieFromLabel)

import Chartjs.Common as Common
import Color exposing (Color)


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


defaultPieFromLabel : String -> DataSet
defaultPieFromLabel label =
  defaultPieFromData label []

defaultPieFromData : String -> List Float -> DataSet
defaultPieFromData label data =
    { label = label
    , data = data
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

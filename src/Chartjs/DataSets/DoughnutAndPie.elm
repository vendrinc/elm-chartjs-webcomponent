module Chartjs.DataSets.DoughnutAndPie exposing
    ( DataSet
    , defaultPieFromData
    , defaultPieFromLabel
    , setBackgroundColor
    , setBorderAlign
    , setBorderColor
    , setBorderWidth
    , setHoverBackgroundColor
    , setHoverBorderColor
    , setHoverBorderWidth
    )

import Chartjs.Common as Common
import Color exposing (Color)


type alias DataSet =
    { label : String
    , -- The label for the dataset which appears in the legend and tooltips.
      data : List Float
    , backgroundColor : Maybe (Common.PointProperty Color)
    , -- The fill color of the arcs in the dataset.
      borderAlign : Maybe String
    , -- Whether the borders of arcs should overlap or not
      borderColor : Maybe (Common.PointProperty Color)
    , -- The border color of the arcs in the dataset.
      borderWidth : Maybe (Common.PointProperty Float)
    , -- The border width of the arcs in the dataset.
      hoverBackgroundColor : Maybe (Common.PointProperty Color)
    , -- The fill colour of the arcs when hovered.
      hoverBorderColor : Maybe (Common.PointProperty Color)
    , -- The stroke colour of the arcs when hovered.
      hoverBorderWidth : Maybe (Common.PointProperty Float)

    -- The stroke width of the arcs when hovered.
    }


defaultPieFromLabel : String -> DataSet
defaultPieFromLabel label =
    defaultPieFromData label []


defaultPieFromData : String -> List Float -> DataSet
defaultPieFromData label data =
    { label = label
    , data = data
    , backgroundColor = Nothing
    , borderAlign = Nothing
    , borderColor = Nothing
    , borderWidth = Nothing
    , hoverBackgroundColor = Nothing
    , hoverBorderColor = Nothing
    , hoverBorderWidth = Nothing
    }


setData : List Float -> DataSet -> DataSet
setData data dataset =
    { dataset | data = data }


setBackgroundColor : Common.PointProperty Color -> DataSet -> DataSet
setBackgroundColor color dataset =
    { dataset | backgroundColor = Just color }


setBorderAlign : String -> DataSet -> DataSet
setBorderAlign align dataset =
    { dataset | borderAlign = Just align }


setBorderColor : Common.PointProperty Color -> DataSet -> DataSet
setBorderColor color dataset =
    { dataset | borderColor = Just color }


setBorderWidth : Common.PointProperty Float -> DataSet -> DataSet
setBorderWidth width dataset =
    { dataset | borderWidth = Just width }


setHoverBackgroundColor : Common.PointProperty Color -> DataSet -> DataSet
setHoverBackgroundColor color dataset =
    { dataset | hoverBackgroundColor = Just color }


setHoverBorderColor : Common.PointProperty Color -> DataSet -> DataSet
setHoverBorderColor color dataset =
    { dataset | hoverBorderColor = Just color }


setHoverBorderWidth : Common.PointProperty Float -> DataSet -> DataSet
setHoverBorderWidth width dataset =
    { dataset | hoverBorderWidth = Just width }

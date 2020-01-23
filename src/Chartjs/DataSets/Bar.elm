module Chartjs.DataSets.Bar exposing
    ( DataSet
    , defaultBarFromData
    , defaultBarFromLabel
    , setBackgroundColor
    , setBorderColor
    , setBorderSkipped
    , setBorderWidth
    , setHoverBackgroundColor
    , setHoverBorderColor
    , setHoverBorderWidth
    , setXAxisID
    , setYAxisID
    )

import Chartjs.Common as Common
import Color exposing (Color)


type alias DataSet =
    { label : String
    , -- The label for the dataset which appears in the legend and tooltips.
      data : List Float
    , xAxisID : Maybe String
    , --	The ID of the x axis to plot this dataset on. If not specified, this defaults to the ID of the first found x axis
      yAxisID : Maybe String
    , -- The ID of the y axis to plot this dataset on. If not specified, this defaults to the ID of the first found y axis.
      backgroundColor : Maybe (Common.PointProperty Color)
    , -- The fill color of the bar. See Colors
      borderColor : Maybe (Common.PointProperty Color)
    , -- The color of the bar border. See Colors
      borderWidth : Maybe (Common.PointProperty Float)
    , -- The stroke width of the bar in pixels.
      borderSkipped : Maybe String
    , -- Which edge to skip drawing the border for. more...
      hoverBackgroundColor : Maybe (Common.PointProperty Color)
    , -- The fill colour of the bars when hovered.
      hoverBorderColor : Maybe (Common.PointProperty Color)
    , -- The stroke colour of the bars when hovered.
      hoverBorderWidth : Maybe (Common.PointProperty Float) -- The stroke width of the bars when hovered.
    }


defaultBarFromLabel : String -> DataSet
defaultBarFromLabel label =
    defaultBarFromData label []


defaultBarFromData : String -> List Float -> DataSet
defaultBarFromData label data =
    { label = label
    , data = data
    , xAxisID = Nothing
    , yAxisID = Nothing
    , backgroundColor = Nothing
    , borderColor = Nothing
    , borderWidth = Nothing
    , borderSkipped = Nothing
    , hoverBackgroundColor = Nothing
    , hoverBorderColor = Nothing
    , hoverBorderWidth = Nothing
    }


setData : List Float -> DataSet -> DataSet
setData data dataset =
    { dataset | data = data }


setXAxisID : String -> DataSet -> DataSet
setXAxisID id dataset =
    { dataset | xAxisID = Just id }


setYAxisID : String -> DataSet -> DataSet
setYAxisID id dataset =
    { dataset | yAxisID = Just id }


setBackgroundColor : Common.PointProperty Color -> DataSet -> DataSet
setBackgroundColor color dataset =
    { dataset | backgroundColor = Just color }


setBorderColor : Common.PointProperty Color -> DataSet -> DataSet
setBorderColor color dataset =
    { dataset | borderColor = Just color }


setBorderWidth : Common.PointProperty Float -> DataSet -> DataSet
setBorderWidth width dataset =
    { dataset | borderWidth = Just width }


setBorderSkipped : String -> DataSet -> DataSet
setBorderSkipped border dataset =
    { dataset | borderSkipped = Just border }


setHoverBackgroundColor : Common.PointProperty Color -> DataSet -> DataSet
setHoverBackgroundColor color dataset =
    { dataset | hoverBackgroundColor = Just color }


setHoverBorderColor : Common.PointProperty Color -> DataSet -> DataSet
setHoverBorderColor color dataset =
    { dataset | hoverBorderColor = Just color }


setHoverBorderWidth : Common.PointProperty Float -> DataSet -> DataSet
setHoverBorderWidth width dataset =
    { dataset | hoverBorderWidth = Just width }

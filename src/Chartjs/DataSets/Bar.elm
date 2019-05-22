module Chartjs.DataSets.Bar exposing (DataSet, defaultBarFromLabel, encodeBarChartDataSet)

import Color exposing (Color)
import Json.Encode as Encode
import Chartjs.Common as Common
import Chartjs.Util as Encode

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
    { label = label
    , data = []
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


encodeBarChartDataSet : DataSet -> Encode.Value
encodeBarChartDataSet barChartDataSet =
    Encode.beginObject
        |> Encode.stringField "label" barChartDataSet.label
        |> Encode.listField "data" Encode.float barChartDataSet.data
        |> Encode.maybeStringField "xAxisID" barChartDataSet.xAxisID
        |> Encode.maybeStringField "yAxisID" barChartDataSet.yAxisID
        |> Encode.maybeCustomField "backgroundColor" (Common.encodePointProperty Encode.encodeColor) barChartDataSet.backgroundColor
        |> Encode.maybeCustomField "borderColor" (Common.encodePointProperty Encode.encodeColor) barChartDataSet.borderColor
        |> Encode.maybeCustomField "borderWidth" (Common.encodePointProperty Encode.float) barChartDataSet.borderWidth
        |> Encode.maybeStringField "borderSkipped" barChartDataSet.borderSkipped
        |> Encode.maybeCustomField "hoverBackgroundColor" (Common.encodePointProperty Encode.encodeColor) barChartDataSet.hoverBackgroundColor
        |> Encode.maybeCustomField "hoverBorderColor" (Common.encodePointProperty Encode.encodeColor) barChartDataSet.hoverBorderColor
        |> Encode.maybeCustomField "hoverBorderWidth" (Common.encodePointProperty Encode.float) barChartDataSet.hoverBorderWidth
        |> Encode.toValue

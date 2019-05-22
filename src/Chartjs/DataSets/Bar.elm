module Chartjs.DataSets.Bar exposing (DataSet, defaultFromLabel)

{-| Types for Bar chart

@docs DataSet, defaultFromLabel

-}

import Chartjs.Common as Common
import Color exposing (Color)


{-| DataSet |
-}
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


{-| defaultFromLabel |
-}
defaultFromLabel : String -> DataSet
defaultFromLabel label =
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

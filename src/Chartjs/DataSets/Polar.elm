module Chartjs.DataSets.Polar exposing
    ( DataSet
    , defaultPolarFromData
    , defaultPolarFromLabel
    )

import Chartjs.Common as Common
import Color exposing (Color)


type alias DataSet =
    { label : String
    , data : List Float
    , backgroundColor : Maybe (Common.PointProperty Color)
    , borderAlign : Maybe String
    , borderColor : Maybe (Common.PointProperty Color)
    , borderWidth : Maybe (Common.PointProperty Float)
    , hoverBackgroundColor : Maybe (Common.PointProperty Color)
    , hoverBorderColor : Maybe (Common.PointProperty Color)
    , hoverBorderWidth : Maybe (Common.PointProperty Float)
    }


defaultPolarFromLabel : String -> DataSet
defaultPolarFromLabel label =
    defaultPolarFromData label []


defaultPolarFromData : String -> List Float -> DataSet
defaultPolarFromData label data =
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

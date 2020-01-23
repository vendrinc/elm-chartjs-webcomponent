module Chartjs.DataSets.Polar exposing
    ( DataSet
    , defaultPolarFromData
    , defaultPolarFromLabel
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

module Chartjs.DataSets.DoughnutAndPie exposing
    ( DataSet, defaultPieFromLabel, defaultPieFromData
    , setData, setBackgroundColor, setBorderAlign, setBorderColor, setBorderWidth
    , setHoverBackgroundColor, setHoverBorderColor, setHoverBorderWidth
    )

{-|

@docs DataSet, defaultPieFromLabel, defaultPieFromData
@docs setData, setBackgroundColor, setBorderAlign, setBorderColor, setBorderWidth
@docs setHoverBackgroundColor, setHoverBorderColor, setHoverBorderWidth

-}

import Chartjs.Common as Common
import Color exposing (Color)


{-| Todo
-}
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


{-| Create a Pie dataset with just a label
-}
defaultPieFromLabel : String -> DataSet
defaultPieFromLabel label =
    defaultPieFromData label []


{-| Create a Pie dataset with a label and data
-}
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


{-| Set the data displayed by this dataset
This is a list of floats, where each float is represented as an arc
-}
setData : List Float -> DataSet -> DataSet
setData data dataset =
    { dataset | data = data }


{-| Fill color of the arcs
-}
setBackgroundColor : Common.PointProperty Color -> DataSet -> DataSet
setBackgroundColor color dataset =
    { dataset | backgroundColor = Just color }


{-| Whether the borders of each arc should overlap or not
Set to 'center' to overlap
Set to 'inner' to not overlap
-}
setBorderAlign : String -> DataSet -> DataSet
setBorderAlign align dataset =
    { dataset | borderAlign = Just align }


{-| Color of the border
-}
setBorderColor : Common.PointProperty Color -> DataSet -> DataSet
setBorderColor color dataset =
    { dataset | borderColor = Just color }


{-| Width of the border
-}
setBorderWidth : Common.PointProperty Float -> DataSet -> DataSet
setBorderWidth width dataset =
    { dataset | borderWidth = Just width }


{-| Fill color of the arcs when hovered
-}
setHoverBackgroundColor : Common.PointProperty Color -> DataSet -> DataSet
setHoverBackgroundColor color dataset =
    { dataset | hoverBackgroundColor = Just color }


{-| Border color of the arcs when hovered
-}
setHoverBorderColor : Common.PointProperty Color -> DataSet -> DataSet
setHoverBorderColor color dataset =
    { dataset | hoverBorderColor = Just color }


{-| Width of the border when hovered
-}
setHoverBorderWidth : Common.PointProperty Float -> DataSet -> DataSet
setHoverBorderWidth width dataset =
    { dataset | hoverBorderWidth = Just width }

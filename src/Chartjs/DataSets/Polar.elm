module Chartjs.DataSets.Polar exposing
    ( DataSet, defaultPolarFromLabel, defaultPolarFromData
    , setData, setBackgroundColor, setBorderAlign, setBorderColor, setBorderWidth, setHoverBackgroundColor, setHoverBorderColor, setHoverBorderWidth
    )

{-| Polar charts are similar to pie charts, but each segment has the same angle

  - the radius of the segment differs depending on the value.

@docs DataSet, defaultPolarFromLabel, defaultPolarFromData
@docs setData, setBackgroundColor, setBorderAlign, setBorderColor, setBorderWidth, setHoverBackgroundColor, setHoverBorderColor, setHoverBorderWidth

-}

import Chartjs.Common as Common
import Color exposing (Color)


{-| For further information on these properties, see <https://www.chartjs.org/docs/latest/charts/polar.html>

You should not use the dataset type directly
Instead use the updater pipeline functions:

    defaultBarFromLabel "Example"
        |> setBackgroundColor (Common.All Color.red)
        |> setBorderColor (Common.All Color.white)

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


{-| Create a Polar dataset with just a label
-}
defaultPolarFromLabel : String -> DataSet
defaultPolarFromLabel label =
    defaultPolarFromData label []


{-| Create a Polar dataset with a label and data
-}
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


{-| Set the data displayed by this dataset
This is a list of floats, where each float is represented as a segment on the chart
-}
setData : List Float -> DataSet -> DataSet
setData data dataset =
    { dataset | data = data }


{-| Fill color of the segments
-}
setBackgroundColor : Common.PointProperty Color -> DataSet -> DataSet
setBackgroundColor color dataset =
    { dataset | backgroundColor = Just color }


{-| Whether the borders of each segment should overlap or not
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


{-| Fill color of the segments when hovered
-}
setHoverBackgroundColor : Common.PointProperty Color -> DataSet -> DataSet
setHoverBackgroundColor color dataset =
    { dataset | hoverBackgroundColor = Just color }


{-| Border color of the segements when hovered
-}
setHoverBorderColor : Common.PointProperty Color -> DataSet -> DataSet
setHoverBorderColor color dataset =
    { dataset | hoverBorderColor = Just color }


{-| Width of the border when hovered
-}
setHoverBorderWidth : Common.PointProperty Float -> DataSet -> DataSet
setHoverBorderWidth width dataset =
    { dataset | hoverBorderWidth = Just width }

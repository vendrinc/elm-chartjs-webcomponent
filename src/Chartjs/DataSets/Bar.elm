module Chartjs.DataSets.Bar exposing
    ( DataSet, defaultBarFromLabel, defaultBarFromData
    , setData, setXAxisID, setYAxisID, setBackgroundColor, setBorderColor, setBorderWidth, setBorderSkipped
    , setHoverBackgroundColor, setHoverBorderColor, setHoverBorderWidth
    )

{-| A bar chart provides a way of showing data values represented as vertical bars.

@docs DataSet, defaultBarFromLabel, defaultBarFromData
@docs setData, setXAxisID, setYAxisID, setBackgroundColor, setBorderColor, setBorderWidth, setBorderSkipped
@docs setHoverBackgroundColor, setHoverBorderColor, setHoverBorderWidth

-}

import Chartjs.Common as Common
import Color exposing (Color)


{-| For further information on these properties, see <https://www.chartjs.org/docs/latest/charts/bar.html>

You should not use the dataset type directly
Instead use the updater pipeline functions:

    defaultBarFromLabel "Example"
        |> setBackgroundColor (Common.All Color.red)
        |> setBorderColor (Common.All Color.white)

-}
type alias DataSet =
    { label : String
    , data : List Float
    , xAxisID : Maybe String
    , yAxisID : Maybe String
    , backgroundColor : Maybe (Common.PointProperty Color)
    , borderColor : Maybe (Common.PointProperty Color)
    , borderWidth : Maybe (Common.PointProperty Float)
    , borderSkipped : Maybe String
    , hoverBackgroundColor : Maybe (Common.PointProperty Color)
    , hoverBorderColor : Maybe (Common.PointProperty Color)
    , hoverBorderWidth : Maybe (Common.PointProperty Float)
    }


{-| Create a Bar dataset with just a label
-}
defaultBarFromLabel : String -> DataSet
defaultBarFromLabel label =
    defaultBarFromData label []


{-| Create a Bar dataset with a label and data
-}
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


{-| Set the data displayed by this dataset
This is a list of floats, where each float is represented as a bar
-}
setData : List Float -> DataSet -> DataSet
setData data dataset =
    { dataset | data = data }


{-| The ID of the X axis to plot the dataset on
-}
setXAxisID : String -> DataSet -> DataSet
setXAxisID id dataset =
    { dataset | xAxisID = Just id }


{-| The ID of the Y axis to plot the dataset on
-}
setYAxisID : String -> DataSet -> DataSet
setYAxisID id dataset =
    { dataset | yAxisID = Just id }


{-| Fill color of the bar
-}
setBackgroundColor : Common.PointProperty Color -> DataSet -> DataSet
setBackgroundColor color dataset =
    { dataset | backgroundColor = Just color }


{-| Border color of the bar
-}
setBorderColor : Common.PointProperty Color -> DataSet -> DataSet
setBorderColor color dataset =
    { dataset | borderColor = Just color }


{-| Stroke width of the bar in pixels
-}
setBorderWidth : Common.PointProperty Float -> DataSet -> DataSet
setBorderWidth width dataset =
    { dataset | borderWidth = Just width }


{-| Which edge to skip drawing border for
One of: 'bottom' 'left' 'top' 'right'
-}
setBorderSkipped : String -> DataSet -> DataSet
setBorderSkipped border dataset =
    { dataset | borderSkipped = Just border }


{-| Fill color of the bar when hovered
-}
setHoverBackgroundColor : Common.PointProperty Color -> DataSet -> DataSet
setHoverBackgroundColor color dataset =
    { dataset | hoverBackgroundColor = Just color }


{-| Border color of the bar when hovered
-}
setHoverBorderColor : Common.PointProperty Color -> DataSet -> DataSet
setHoverBorderColor color dataset =
    { dataset | hoverBorderColor = Just color }


{-| Border width of the bar when hovered
-}
setHoverBorderWidth : Common.PointProperty Float -> DataSet -> DataSet
setHoverBorderWidth width dataset =
    { dataset | hoverBorderWidth = Just width }

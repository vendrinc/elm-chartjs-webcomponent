module Chartjs.DataSets.Bar exposing
    ( DataSet, defaultBarFromLabel, defaultBarFromData
    , setData, setLabel, setHidden, setOrder, setStack
    , setIndexAxis, setXAxisID, setYAxisID
    , setBackgroundColor, setBorderColor, setBorderRadius, setBorderSkipped, setBorderWidth
    , setHoverBackgroundColor, setHoverBorderColor, setHoverBorderWidth
    , setBarPercentage, setBarThickness, setCategoryPercentage, setMaxBarThickness, setMinBarLength
    )

{-| A bar chart provides a way of showing data values represented as vertical bars.

@docs DataSet, defaultBarFromLabel, defaultBarFromData
@docs setData, setLabel, setHidden, setOrder, setStack
@docs setIndexAxis, setXAxisID, setYAxisID
@docs setBackgroundColor, setBorderColor, setBorderRadius, setBorderSkipped, setBorderWidth
@docs setHoverBackgroundColor, setHoverBorderColor, setHoverBorderWidth
@docs setBarPercentage, setBarThickness, setCategoryPercentage, setMaxBarThickness, setMinBarLength

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
    , hidden : Maybe Bool
    , order : Maybe Int
    , stack : Maybe String
    , indexAxis : Maybe Common.IndexAxis
    , xAxisID : Maybe String
    , yAxisID : Maybe String
    , backgroundColor : Maybe (Common.PointProperty Color)
    , barPercentage : Maybe Float
    , barThickness : Maybe Int
    , borderColor : Maybe (Common.PointProperty Color)
    , borderRadius : Maybe (Common.PointProperty Int)
    , borderSkipped : Maybe String
    , borderWidth : Maybe (Common.PointProperty Float)
    , categoryPercentage : Maybe Float
    , hoverBackgroundColor : Maybe (Common.PointProperty Color)
    , hoverBorderColor : Maybe (Common.PointProperty Color)
    , hoverBorderWidth : Maybe (Common.PointProperty Float)
    , maxBarThickness : Maybe Int
    , minBarLength : Maybe Int
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
    , hidden = Nothing
    , order = Nothing
    , stack = Nothing
    , indexAxis = Nothing
    , xAxisID = Nothing
    , yAxisID = Nothing
    , backgroundColor = Nothing
    , barPercentage = Nothing
    , barThickness = Nothing
    , borderColor = Nothing
    , borderRadius = Nothing
    , borderSkipped = Nothing
    , borderWidth = Nothing
    , categoryPercentage = Nothing
    , hoverBackgroundColor = Nothing
    , hoverBorderColor = Nothing
    , hoverBorderWidth = Nothing
    , maxBarThickness = Nothing
    , minBarLength = Nothing
    }


{-| Set the label for this dataset
-}
setLabel : String -> DataSet -> DataSet
setLabel label dataset =
    { dataset | label = label }


{-| Set the data displayed by this dataset
This is a list of floats, where each float is represented as a bar
-}
setData : List Float -> DataSet -> DataSet
setData data dataset =
    { dataset | data = data }


{-| Set whether this dataset should be hidden from the chart
-}
setHidden : Bool -> DataSet -> DataSet
setHidden hidden dataset =
    { dataset | hidden = Just hidden }


{-| Set the drawing order of the dataset
This also affects stacking, tooltips, and legends
-}
setOrder : Int -> DataSet -> DataSet
setOrder order dataset =
    { dataset | order = Just order }


{-| ID of the group, used for stacking datasets
eg. two datasets with the same field for stack will be stacked together
-}
setStack : String -> DataSet -> DataSet
setStack stack dataset =
    { dataset | stack = Just stack }


{-| Which axis to use for indexing
Set to XAxis for a vertical chart, set to YAxis for a horizontal chart
-}
setIndexAxis : Common.IndexAxis -> DataSet -> DataSet
setIndexAxis indexAxis dataset =
    { dataset | indexAxis = Just indexAxis }


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


{-| 0-1 percentage of the available width each bar should be within the category width.
-}
setBarPercentage : Float -> DataSet -> DataSet
setBarPercentage percentage dataset =
    { dataset | barPercentage = Just percentage }


{-| Manually force the width (in pixels) of each bar
-}
setBarThickness : Int -> DataSet -> DataSet
setBarThickness thickness dataset =
    { dataset | barThickness = Just thickness }


{-| Border color of the bar
-}
setBorderColor : Common.PointProperty Color -> DataSet -> DataSet
setBorderColor color dataset =
    { dataset | borderColor = Just color }


{-| Border radius for each bar
-}
setBorderRadius : Common.PointProperty Int -> DataSet -> DataSet
setBorderRadius radius dataset =
    { dataset | borderRadius = Just radius }


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


{-| Percent (0-1) of the available width each category should be within the sample width.
-}
setCategoryPercentage : Float -> DataSet -> DataSet
setCategoryPercentage percentage dataset =
    { dataset | categoryPercentage = Just percentage }


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


{-| Max bar thickness, in pixels
If set, bars will not be thicker than this value
-}
setMaxBarThickness : Int -> DataSet -> DataSet
setMaxBarThickness thickness dataset =
    { dataset | maxBarThickness = Just thickness }


{-| Minimum bar length, in pixels
If set, bars will not be shorter than this value
-}
setMinBarLength : Int -> DataSet -> DataSet
setMinBarLength length dataset =
    { dataset | minBarLength = Just length }

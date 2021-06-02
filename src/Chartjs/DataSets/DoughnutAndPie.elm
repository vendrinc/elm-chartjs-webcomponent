module Chartjs.DataSets.DoughnutAndPie exposing
    ( DataSet, defaultPieFromLabel, defaultPieFromData
    , setLabel, setData, setHidden, setOrder
    , setCircumference, setCutout, setOffset, setRotation, setWeight
    , setBackgroundColor, setBorderAlign, setBorderColor, setBorderWidth
    , setHoverBackgroundColor, setHoverBorderColor, setHoverBorderWidth
    )

{-| Pie and doughnut charts are divided into segments, where the arc of each segment shows the proportion of each data.

In Chart.js, these two charts are essentially the same. The only different value is the cutoutPercentage.
This dataset class will work for either pie or doughtnut charts interchangably

@docs DataSet, defaultPieFromLabel, defaultPieFromData
@docs setLabel, setData, setHidden, setOrder


## Pies

Pie datasets are quite similar to bar dataset - provide a dataset label and a list of floats

    defaultPieFromData "Example Chart" [ 4, 8, 15, 16, 23, 42 ]

When grouping datasets into a chart data object, the labels specified will be used as the categories:

    dataset =
        defaultPieFromData "Example Chart" [ 4, 8, 15, 16, 23, 42 ]
            |> ChartData.PieData

    data =
        ChartData.dataFromLabels [ "One", "Two", "Three", "Four", "Five", "Six" ]
            |> ChartData.addDataset dataset


## Doughnuts, Arcs, and Other Shapes

There are a wide variety of methods that can be used to adjust the shape of your pie chart.
By setting a cutout value, a pie dataset will be transformed into a doughnut dataset.

    defaultPieFromData "Example Chart" [ 4, 8, 15, 16, 23, 42 ]
        |> setCutout 50

To create an arc, set the circumference and initial rotation (both in degrees) to adjust the extents of the chart:

    defaultPieFromData "Bottom Half Pie" [ 4, 8, 15, 16, 23, 42 ]
        |> setCircumference 180
        |> setRotation 90

@docs setCircumference, setCutout, setOffset, setRotation, setWeight


## Colors and Borders

@docs setBackgroundColor, setBorderAlign, setBorderColor, setBorderWidth
@docs setHoverBackgroundColor, setHoverBorderColor, setHoverBorderWidth

-}

import Chartjs.Common as Common
import Color exposing (Color)


{-| For further information on these properties, see <https://www.chartjs.org/docs/latest/charts/doughnut.html>

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
    , backgroundColor : Maybe (Common.PointProperty Color)
    , borderAlign : Maybe String
    , borderColor : Maybe (Common.PointProperty Color)
    , borderWidth : Maybe (Common.PointProperty Float)
    , circumference : Maybe Int
    , cutout : Maybe Int
    , hoverBackgroundColor : Maybe (Common.PointProperty Color)
    , hoverBorderColor : Maybe (Common.PointProperty Color)
    , hoverBorderWidth : Maybe (Common.PointProperty Float)
    , offset : Maybe (Common.PointProperty Int)
    , rotation : Maybe Int
    , weight : Maybe Float
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
    , hidden = Nothing
    , order = Nothing
    , backgroundColor = Nothing
    , borderAlign = Nothing
    , borderColor = Nothing
    , borderWidth = Nothing
    , circumference = Nothing
    , cutout = Nothing
    , hoverBackgroundColor = Nothing
    , hoverBorderColor = Nothing
    , hoverBorderWidth = Nothing
    , offset = Nothing
    , rotation = Nothing
    , weight = Nothing
    }


{-| Set the label for this dataset
-}
setLabel : String -> DataSet -> DataSet
setLabel label dataset =
    { dataset | label = label }


{-| Set the data displayed by this dataset
This is a list of floats, where each float is represented as an arc
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


{-| Total sweep, in degrees, to allow arcs to cover
-}
setCircumference : Int -> DataSet -> DataSet
setCircumference deg dataset =
    { dataset | circumference = Just deg }


{-| Cutout, in pixels
-}
setCutout : Int -> DataSet -> DataSet
setCutout cutout dataset =
    { dataset | cutout = Just cutout }


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


{-| Offset for each arc, in pixels
-}
setOffset : Common.PointProperty Int -> DataSet -> DataSet
setOffset off dataset =
    { dataset | offset = Just off }


{-| Starting angle, in degrees, to draw dataset from
-}
setRotation : Int -> DataSet -> DataSet
setRotation deg dataset =
    { dataset | rotation = Just deg }


{-| The relative thickness of this dataset
If specified, then this dataset will be drawn with a thickness relative to the sum of all dataset weights
-}
setWeight : Float -> DataSet -> DataSet
setWeight weight dataset =
    { dataset | weight = Just weight }

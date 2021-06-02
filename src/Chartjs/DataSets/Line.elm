module Chartjs.DataSets.Line exposing
    ( DataPoints(..), DataSet, defaultLineFromLabel
    , setLabel, setData, setPointData, setHidden, setOrder
    , defaultLineFromData
    , setBorderColor, setBorderWidth, setBorderDash, setBorderDashOffset, setBorderCapStyle, setBorderJoinStyle
    , setShowLine, setCubicInterpolationMode, setLineTension, setSteppedLine, SteppedLine(..)
    , defaultLineFromPointData
    , setPointBackgroundColor, setPointBorderColor, setPointBorderWidth, setPointRadius, setPointStyle, setPointRotation
    , setPointHitRadius, setPointHoverBackgroundColor, setPointHoverBorderColor, setPointHoverBorderWidth, setPointHoverRadius
    , setFill, FillMode(..), FillBoundary(..), setBackgroundColor
    , setIndexAxis, setXAxisID, setYAxisID, setSpanGaps
    )

{-| The Line dataset is the most general dataset - it can be used for line graphs, area charts, and even scatter plots

@docs DataPoints, DataSet, defaultLineFromLabel

@docs setLabel, setData, setPointData, setHidden, setOrder


# Lines

Line datasets are super easy to create - just provide a dataset label and a list of numbers:

    defaultLineFromData "Dataset Label" [ 1, 2, 3, 4, 5 ]

@docs defaultLineFromData

You can then adjust the line styling with pipeline operators:

    defaultLineFromData "Dataset Label" [ 1, 2, 3, 4, 5 ]
        |> setBorderWidth 4
        |> setLineTension 0.5

@docs setBorderColor, setBorderWidth, setBorderDash, setBorderDashOffset, setBorderCapStyle, setBorderJoinStyle

By default, the line will linearly connect points. You can adjust the interpolation, or set the line to produce a stepped chart instead:

@docs setShowLine, setCubicInterpolationMode, setLineTension, setSteppedLine, SteppedLine


# Scatters

Scatter charts are essentially line charts without a line

    defaultLineFromPointData "Scatter" [ ( 1, 2 ), ( 2, 5 ), ( 3, 8 ) ]
        |> setShowLine False

For best results, you'll also want to assign a linear scale to your chart

@docs defaultLineFromPointData

You can style the points in various ways.

@docs setPointBackgroundColor, setPointBorderColor, setPointBorderWidth, setPointRadius, setPointStyle, setPointRotation

Certain properties are used to change how points are displayed when hovered over:

@docs setPointHitRadius, setPointHoverBackgroundColor, setPointHoverBorderColor, setPointHoverBorderWidth, setPointHoverRadius


# Filling Areas

    defaultLineFromData "Filled Chart" [ 1, 2, 3, 4, 5 ]
        |> setFill (Boundary Origin)

@docs setFill, FillMode, FillBoundary, setBackgroundColor


# Other

See the [`Scale`](Chartjs-Options-Scale) module for more information on custom axes

@docs setIndexAxis, setXAxisID, setYAxisID, setSpanGaps

-}

import Chartjs.Common as Common
import Color exposing (Color)


{-| These datasets can be made from two different data formats
Either a list of numbers can be specified, or a list of (x, y) tuples

See <https://www.chartjs.org/docs/latest/general/data-structures.html> for more info

-}
type DataPoints
    = Numbers (List Float)
    | Points (List ( Float, Float ))


{-| For further information on these properties, see <https://www.chartjs.org/docs/latest/charts/line.html>
-}
type alias DataSet =
    { label : String
    , data : DataPoints
    , hidden : Maybe Bool
    , order : Maybe Int
    , indexAxis : Maybe Common.IndexAxis
    , xAxisID : Maybe String
    , yAxisID : Maybe String
    , backgroundColor : Maybe (Common.PointProperty Color)
    , borderColor : Maybe (Common.PointProperty Color)
    , borderWidth : Maybe (Common.PointProperty Float)
    , borderDash : Maybe (Common.PointProperty Float)
    , borderDashOffset : Maybe Float
    , borderCapStyle : Maybe String
    , borderJoinStyle : Maybe String
    , cubicInterpolationMode : Maybe String
    , fill : Maybe FillMode
    , lineTension : Maybe Float
    , pointBackgroundColor : Maybe (Common.PointProperty Color)
    , pointBorderColor : Maybe (Common.PointProperty Color)
    , pointBorderWidth : Maybe (Common.PointProperty Float)
    , pointRadius : Maybe (Common.PointProperty Float)
    , pointStyle : Maybe (Common.PointProperty Common.PointStyle)
    , pointRotation : Maybe (Common.PointProperty Float)
    , pointHitRadius : Maybe (Common.PointProperty Float)
    , pointHoverBackgroundColor : Maybe (Common.PointProperty Color)
    , pointHoverBorderColor : Maybe (Common.PointProperty Color)
    , pointHoverBorderWidth : Maybe (Common.PointProperty Float)
    , pointHoverRadius : Maybe (Common.PointProperty Float)
    , showLine : Maybe Bool
    , spanGaps : Maybe Bool
    , steppedLine : Maybe SteppedLine
    }


{-| Step Interpolation for lines <https://www.chartjs.org/docs/3.3.2/charts/line.html#stepped>

BeforeInterpolation: Step-before Interpolation

AfterInterpolation: Step-after Interpolation

-}
type SteppedLine
    = NoInterpolation
    | BeforeInterpolation
    | AfterInterpolation


{-| Fill modes handle how area charts should be displayed
Can be:

  - an absolute dataset index
  - a relative dataset index
  - between the dataset and the boundaries

-}
type FillMode
    = Absolute Int
    | Relative Int --possibly needs to be String, '-1', '-2', '+1', ...
    | Boundary FillBoundary
    | Disabled


{-| Which boundary to use when using FillBoundary
Can be the scale origin, start, or end
-}
type FillBoundary
    = Start
    | End
    | Origin


{-| Create a Line dataset with just a label
-}
defaultLineFromLabel : String -> DataSet
defaultLineFromLabel label =
    defaultLineFromData label []


{-| Create a Line dataset with a label and data list
To create a dataset from points, see defaultLineFromPointData
-}
defaultLineFromData : String -> List Float -> DataSet
defaultLineFromData label data =
    { label = label
    , data = Numbers data
    , hidden = Nothing
    , order = Nothing
    , indexAxis = Nothing
    , xAxisID = Nothing
    , yAxisID = Nothing
    , backgroundColor = Nothing
    , borderColor = Nothing
    , borderWidth = Nothing
    , borderDash = Nothing
    , borderDashOffset = Nothing
    , borderCapStyle = Nothing
    , borderJoinStyle = Nothing
    , cubicInterpolationMode = Nothing
    , fill = Nothing
    , lineTension = Nothing
    , pointBackgroundColor = Nothing
    , pointBorderColor = Nothing
    , pointBorderWidth = Nothing
    , pointRadius = Nothing
    , pointStyle = Nothing
    , pointRotation = Nothing
    , pointHitRadius = Nothing
    , pointHoverBackgroundColor = Nothing
    , pointHoverBorderColor = Nothing
    , pointHoverBorderWidth = Nothing
    , pointHoverRadius = Nothing
    , showLine = Nothing
    , spanGaps = Nothing
    , steppedLine = Nothing
    }


{-| Create a Line dataset with a label and points list
-}
defaultLineFromPointData : String -> List ( Float, Float ) -> DataSet
defaultLineFromPointData label data =
    defaultLineFromLabel label
        |> setPointData data


{-| Set the label for this dataset
-}
setLabel : String -> DataSet -> DataSet
setLabel label dataset =
    { dataset | label = label }


{-| Set the data displayed by this dataset
This is a list of floats, where each float is represented as a point on the line
-}
setData : List Float -> DataSet -> DataSet
setData data dataset =
    { dataset | data = Numbers data }


{-| Set the data displayed by this dataset, in a point based format
This is a list of tuples, where each tuple defines the X, Y location of a point
-}
setPointData : List ( Float, Float ) -> DataSet -> DataSet
setPointData data dataset =
    { dataset | data = Points data }


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


{-| Which axis to use for indexing
Set to XAxis for a vertical chart, set to YAxis for a horizontal chart
-}
setIndexAxis : Common.IndexAxis -> DataSet -> DataSet
setIndexAxis indexAxis dataset =
    { dataset | indexAxis = Just indexAxis }


{-| The ID of the X axis to plot this dataset on
-}
setXAxisID : String -> DataSet -> DataSet
setXAxisID id dataset =
    { dataset | xAxisID = Just id }


{-| The ID of the Y axis to plot this dataset on
-}
setYAxisID : String -> DataSet -> DataSet
setYAxisID id dataset =
    { dataset | yAxisID = Just id }


{-| Fill color of the area under the bar
Applies for area charts
-}
setBackgroundColor : Common.PointProperty Color -> DataSet -> DataSet
setBackgroundColor color dataset =
    { dataset | backgroundColor = Just color }


{-| Color of the line
-}
setBorderColor : Common.PointProperty Color -> DataSet -> DataSet
setBorderColor color dataset =
    { dataset | borderColor = Just color }


{-| Line width (in pixels)
-}
setBorderWidth : Common.PointProperty Float -> DataSet -> DataSet
setBorderWidth width dataset =
    { dataset | borderWidth = Just width }


{-| Length and spacing of line dashes
-}
setBorderDash : Common.PointProperty Float -> DataSet -> DataSet
setBorderDash dash dataset =
    { dataset | borderDash = Just dash }


{-| Offset for line dashes
-}
setBorderDashOffset : Float -> DataSet -> DataSet
setBorderDashOffset offset dataset =
    { dataset | borderDashOffset = Just offset }


{-| Cap style of the line
-}
setBorderCapStyle : String -> DataSet -> DataSet
setBorderCapStyle cap dataset =
    { dataset | borderCapStyle = Just cap }


{-| Joint style of the line
-}
setBorderJoinStyle : String -> DataSet -> DataSet
setBorderJoinStyle join dataset =
    { dataset | borderJoinStyle = Just join }


{-| Which cubic interpolation mode to use
'default' uses a weighted cubic interpolation
'monotone' is better at preserving monotonicity
-}
setCubicInterpolationMode : String -> DataSet -> DataSet
setCubicInterpolationMode interpolation dataset =
    { dataset | cubicInterpolationMode = Just interpolation }


{-| How to fill the area under the line

The most common use case would be filling the area under a line. For that, you'll want to use Boundary Origin:

    defaultLineFromData "Title" data
        |> setBackgroundColor Color.red
        |> setFill (Boundary Origin)

For more information, check out <https://www.chartjs.org/docs/latest/charts/area.html>

-}
setFill : FillMode -> DataSet -> DataSet
setFill fill dataset =
    { dataset | fill = Just fill }


{-| Beizer curve tension
0 is straight lines

This option is ignored if cubicInterpolation is set to 'monotone'

-}
setLineTension : Float -> DataSet -> DataSet
setLineTension tension dataset =
    { dataset | lineTension = Just tension }


{-| Fill color for points
-}
setPointBackgroundColor : Common.PointProperty Color -> DataSet -> DataSet
setPointBackgroundColor color dataset =
    { dataset | pointBackgroundColor = Just color }


{-| Border color for points
-}
setPointBorderColor : Common.PointProperty Color -> DataSet -> DataSet
setPointBorderColor color dataset =
    { dataset | pointBorderColor = Just color }


{-| Border width (in pixels) for points
-}
setPointBorderWidth : Common.PointProperty Float -> DataSet -> DataSet
setPointBorderWidth width dataset =
    { dataset | pointBorderWidth = Just width }


{-| Radius of the point shape
-}
setPointRadius : Common.PointProperty Float -> DataSet -> DataSet
setPointRadius radius dataset =
    { dataset | pointRadius = Just radius }


{-| Style of the point
-}
setPointStyle : Common.PointProperty Common.PointStyle -> DataSet -> DataSet
setPointStyle style dataset =
    { dataset | pointStyle = Just style }


{-| Rotation of the point (in degrees)
-}
setPointRotation : Common.PointProperty Float -> DataSet -> DataSet
setPointRotation rotation dataset =
    { dataset | pointRotation = Just rotation }


{-| Hit radius for point interactivity
-}
setPointHitRadius : Common.PointProperty Float -> DataSet -> DataSet
setPointHitRadius radius dataset =
    { dataset | pointHitRadius = Just radius }


{-| Fill color for points when hovered
-}
setPointHoverBackgroundColor : Common.PointProperty Color -> DataSet -> DataSet
setPointHoverBackgroundColor color dataset =
    { dataset | pointHoverBackgroundColor = Just color }


{-| Border color for points when hovered
-}
setPointHoverBorderColor : Common.PointProperty Color -> DataSet -> DataSet
setPointHoverBorderColor color dataset =
    { dataset | pointHoverBorderColor = Just color }


{-| Border width for points when hovered
-}
setPointHoverBorderWidth : Common.PointProperty Float -> DataSet -> DataSet
setPointHoverBorderWidth width dataset =
    { dataset | pointHoverBorderWidth = Just width }


{-| Radius for points when hovered
-}
setPointHoverRadius : Common.PointProperty Float -> DataSet -> DataSet
setPointHoverRadius radius dataset =
    { dataset | pointHoverRadius = Just radius }


{-| Whether the line for this dataset should be drawn
-}
setShowLine : Bool -> DataSet -> DataSet
setShowLine show dataset =
    { dataset | showLine = Just show }


{-| Whether points with no data should be filled in or not
-}
setSpanGaps : Bool -> DataSet -> DataSet
setSpanGaps bool dataset =
    { dataset | spanGaps = Just bool }


{-| Set the step interpolation for the line

If set to anything other than false, lineTension will be ignored

-}
setSteppedLine : SteppedLine -> DataSet -> DataSet
setSteppedLine stepped dataset =
    { dataset | steppedLine = Just stepped }

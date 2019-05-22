module Chartjs.DataSets.Line exposing (DataSet, FillBoundary(..), FillMode(..), SteppedLine(..), defaultLineFromLabel, encodeFillMode, encodeLineChartDataSet, encodeSteppedLine)

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
      borderDash : Maybe (Common.PointProperty Float)
    , --	Length and spacing of dashes. See MDN
      borderDashOffset : Maybe Float
    , -- Offset for line dashes. See MDN
      borderCapStyle : Maybe String
    , -- Cap style of the line. See MDN
      borderJoinStyle : Maybe String
    , --	Line joint style. See MDN
      cubicInterpolationMode : Maybe String
    , -- Algorithm used to interpolate a smooth curve from the discrete data points. more...
      fill : Maybe FillMode
    , -- How to fill the area under the line. See area charts
      lineTension : Maybe Float
    , --	Bezier curve tension of the line. Set to 0 to draw straightlines. This option is ignored if monotone cubic interpolation is used.
      pointBackgroundColor : Maybe (Common.PointProperty Color)
    , -- The fill color for points.
      pointBorderColor : Maybe (Common.PointProperty Color)
    , -- The border color for points.
      pointBorderWidth : Maybe (Common.PointProperty Float)
    , -- The width of the point border in pixels.
      pointRadius : Maybe (Common.PointProperty Float)
    , --	The radius of the point shape. If set to 0, the point is not rendered.
      pointStyle : Maybe (Common.PointProperty Common.PointStyle)
    , -- Style of the point. more...
      pointRotation : Maybe (Common.PointProperty Float)
    , --	The rotation of the point in degrees.
      pointHitRadius : Maybe (Common.PointProperty Float)
    , -- The pixel size of the non-displayed point that reacts to mouse events.
      pointHoverBackgroundColor : Maybe (Common.PointProperty Color)
    , -- Point background color when hovered.
      pointHoverBorderColor : Maybe (Common.PointProperty Color)
    , -- 	Point border color when hovered.
      pointHoverBorderWidth : Maybe (Common.PointProperty Float)
    , -- Border width of point when hovered.
      pointHoverRadius : Maybe (Common.PointProperty Float)
    , --	The radius of the point when hovered.
      showLine : Maybe Bool
    , -- If false, the line is not drawn for this dataset.
      spanGaps : Maybe Bool
    , -- If true, lines will be drawn between points with no or null data. If false, points with NaN data will create a break in the line
      steppedLine : Maybe SteppedLine -- If the line is shown as a stepped line. more...
    }


type SteppedLine
    = NoInterpolation
    | BeforeInterpolation
    | AfterInterpolation


type FillMode
    = Absolute Int
    | Relative Int --possibly needs to be String, '-1', '-2', '+1', ...
    | Boundary FillBoundary
    | Disabled


type FillBoundary
    = Start
    | End
    | Origin


defaultLineFromLabel : String -> DataSet
defaultLineFromLabel label =
    { label = label
    , data = []
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


encodeLineChartDataSet : DataSet -> Encode.Value
encodeLineChartDataSet lineChartDataSet =
    Encode.beginObject
        |> Encode.stringField "label" lineChartDataSet.label
        |> Encode.listField "data" Encode.float lineChartDataSet.data
        |> Encode.maybeStringField "xAxisID" lineChartDataSet.xAxisID
        |> Encode.maybeStringField "yAxisID" lineChartDataSet.yAxisID
        |> Encode.maybeCustomField "backgroundColor" (Common.encodePointProperty Encode.encodeColor) lineChartDataSet.backgroundColor
        |> Encode.maybeCustomField "borderColor" (Common.encodePointProperty Encode.encodeColor) lineChartDataSet.borderColor
        |> Encode.maybeCustomField "borderWidth" (Common.encodePointProperty Encode.float) lineChartDataSet.borderWidth
        |> Encode.maybeCustomField "borderDash" (Common.encodePointProperty Encode.float) lineChartDataSet.borderDash
        |> Encode.maybeFloatField "borderDashOffset" lineChartDataSet.borderDashOffset
        |> Encode.maybeStringField "borderCapStyle" lineChartDataSet.borderCapStyle
        |> Encode.maybeStringField "borderJoinStyle" lineChartDataSet.borderJoinStyle
        |> Encode.maybeStringField "cubicInterpolationMode" lineChartDataSet.cubicInterpolationMode
        |> Encode.maybeCustomField "fill" encodeFillMode lineChartDataSet.fill
        |> Encode.maybeFloatField "lineTension" lineChartDataSet.lineTension
        |> Encode.maybeCustomField "pointBackgroundColor" (Common.encodePointProperty Encode.encodeColor) lineChartDataSet.pointBackgroundColor
        |> Encode.maybeCustomField "pointBorderWidth" (Common.encodePointProperty Encode.float) lineChartDataSet.pointBorderWidth
        |> Encode.maybeCustomField "pointRadius" (Common.encodePointProperty Encode.float) lineChartDataSet.pointRadius
        |> Encode.maybeCustomField "pointStyle" (Common.encodePointProperty Common.encodePointStyle) lineChartDataSet.pointStyle
        |> Encode.maybeCustomField "pointRotation" (Common.encodePointProperty Encode.float) lineChartDataSet.pointRotation
        |> Encode.maybeCustomField "pointHitRadius" (Common.encodePointProperty Encode.float) lineChartDataSet.pointHitRadius
        |> Encode.maybeCustomField "pointHoverBackgroundColor" (Common.encodePointProperty Encode.encodeColor) lineChartDataSet.pointHoverBackgroundColor
        |> Encode.maybeCustomField "pointHoverBorderColor" (Common.encodePointProperty Encode.encodeColor) lineChartDataSet.pointHoverBorderColor
        |> Encode.maybeCustomField "pointHoverBorderWidth" (Common.encodePointProperty Encode.float) lineChartDataSet.pointHoverBorderWidth
        |> Encode.maybeCustomField "pointHoverRadius" (Common.encodePointProperty Encode.float) lineChartDataSet.pointHoverRadius
        |> Encode.maybeBoolField "showLine" lineChartDataSet.showLine
        |> Encode.maybeBoolField "spanGaps" lineChartDataSet.spanGaps
        |> Encode.maybeCustomField "steppedLine" encodeSteppedLine lineChartDataSet.steppedLine
        |> Encode.toValue


encodeSteppedLine : SteppedLine -> Encode.Value
encodeSteppedLine steppedLine =
    case steppedLine of
        NoInterpolation ->
            Encode.bool False

        BeforeInterpolation ->
            Encode.string "before"

        AfterInterpolation ->
            Encode.string "after"


encodeFillMode : FillMode -> Encode.Value
encodeFillMode fillMode =
    case fillMode of
        Absolute i ->
            Encode.int i

        Relative i ->
            Encode.int i

        -- BUGBUG, possibly needs to be String, '-1', '-2', '+1', ...
        Boundary Start ->
            Encode.string "start"

        Boundary End ->
            Encode.string "end"

        Boundary Origin ->
            Encode.string "origin"

        Disabled ->
            Encode.bool False

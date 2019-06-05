module Chartjs.Internal.Encode exposing
    ( encodeAnimations
    , encodeArc
    , encodeAxis
    , encodeBarChartDataSet
    , encodeCallbacks
    , encodeData
    , encodeDataset
    , encodeDoughnutAndPieDataSet
    , encodeEasing
    , encodeElements
    , encodeFillMode
    , encodeGridLines
    , encodeLabels
    , encodeLayout
    , encodeLegend
    , encodeLine
    , encodeLineCap
    , encodeLineChartDataSet
    , encodeLineFill
    , encodeLineJoin
    , encodeMode
    , encodeOptions
    , encodePoint
    , encodePointProperty
    , encodePointStyle
    , encodePosition
    , encodePositionMode
    , encodeRectangle
    , encodeScales
    , encodeSteppedLine
    , encodeTicks
    , encodeTitle
    , encodeTooltips
    )

import Chartjs.Common as Common
import Chartjs.Data
import Chartjs.DataSets.Bar
import Chartjs.DataSets.DoughnutAndPie
import Chartjs.DataSets.Line
import Chartjs.Internal.Util as Encode
import Chartjs.Options
import Chartjs.Options.Animations
import Chartjs.Options.Elements
import Chartjs.Options.Layout
import Chartjs.Options.Legend
import Chartjs.Options.Scales
import Chartjs.Options.Title
import Chartjs.Options.Tooltips
import Json.Encode as Encode


encodeBarChartDataSet : Chartjs.DataSets.Bar.DataSet -> Encode.Value
encodeBarChartDataSet barChartDataSet =
    Encode.beginObject
        |> Encode.stringField "label" barChartDataSet.label
        |> Encode.listField "data" Encode.float barChartDataSet.data
        |> Encode.maybeStringField "xAxisID" barChartDataSet.xAxisID
        |> Encode.maybeStringField "yAxisID" barChartDataSet.yAxisID
        |> Encode.maybeCustomField "backgroundColor" (encodePointProperty Encode.encodeColor) barChartDataSet.backgroundColor
        |> Encode.maybeCustomField "borderColor" (encodePointProperty Encode.encodeColor) barChartDataSet.borderColor
        |> Encode.maybeCustomField "borderWidth" (encodePointProperty Encode.float) barChartDataSet.borderWidth
        |> Encode.maybeStringField "borderSkipped" barChartDataSet.borderSkipped
        |> Encode.maybeCustomField "hoverBackgroundColor" (encodePointProperty Encode.encodeColor) barChartDataSet.hoverBackgroundColor
        |> Encode.maybeCustomField "hoverBorderColor" (encodePointProperty Encode.encodeColor) barChartDataSet.hoverBorderColor
        |> Encode.maybeCustomField "hoverBorderWidth" (encodePointProperty Encode.float) barChartDataSet.hoverBorderWidth
        |> Encode.toValue


encodeDoughnutAndPieDataSet : Chartjs.DataSets.DoughnutAndPie.DataSet -> Encode.Value
encodeDoughnutAndPieDataSet barChartDataSet =
    Encode.beginObject
        |> Encode.stringField "label" barChartDataSet.label
        |> Encode.listField "data" Encode.float barChartDataSet.data
        |> Encode.maybeCustomField "backgroundColor" (encodePointProperty Encode.encodeColor) barChartDataSet.backgroundColor
        |> Encode.maybeCustomField "borderColor" (encodePointProperty Encode.encodeColor) barChartDataSet.borderColor
        |> Encode.maybeCustomField "borderWidth" (encodePointProperty Encode.float) barChartDataSet.borderWidth
        |> Encode.maybeCustomField "hoverBackgroundColor" (encodePointProperty Encode.encodeColor) barChartDataSet.hoverBackgroundColor
        |> Encode.maybeCustomField "hoverBorderColor" (encodePointProperty Encode.encodeColor) barChartDataSet.hoverBorderColor
        |> Encode.maybeCustomField "hoverBorderWidth" (encodePointProperty Encode.float) barChartDataSet.hoverBorderWidth
        |> Encode.maybeIntField "cutoutPercentage" barChartDataSet.cutoutPercentage
        |> Encode.maybeIntField "rotation" barChartDataSet.rotation
        |> Encode.maybeIntField "circumference" barChartDataSet.circumference
        |> Encode.toValue


encodeLineChartDataSet : Chartjs.DataSets.Line.DataSet -> Encode.Value
encodeLineChartDataSet lineChartDataSet =
    Encode.beginObject
        |> Encode.stringField "label" lineChartDataSet.label
        |> Encode.listField "data" Encode.float lineChartDataSet.data
        |> Encode.maybeStringField "xAxisID" lineChartDataSet.xAxisID
        |> Encode.maybeStringField "yAxisID" lineChartDataSet.yAxisID
        |> Encode.maybeCustomField "backgroundColor" (encodePointProperty Encode.encodeColor) lineChartDataSet.backgroundColor
        |> Encode.maybeCustomField "borderColor" (encodePointProperty Encode.encodeColor) lineChartDataSet.borderColor
        |> Encode.maybeCustomField "borderWidth" (encodePointProperty Encode.float) lineChartDataSet.borderWidth
        |> Encode.maybeCustomField "borderDash" (encodePointProperty Encode.float) lineChartDataSet.borderDash
        |> Encode.maybeFloatField "borderDashOffset" lineChartDataSet.borderDashOffset
        |> Encode.maybeStringField "borderCapStyle" lineChartDataSet.borderCapStyle
        |> Encode.maybeStringField "borderJoinStyle" lineChartDataSet.borderJoinStyle
        |> Encode.maybeStringField "cubicInterpolationMode" lineChartDataSet.cubicInterpolationMode
        |> Encode.maybeCustomField "fill" encodeFillMode lineChartDataSet.fill
        |> Encode.maybeFloatField "lineTension" lineChartDataSet.lineTension
        |> Encode.maybeCustomField "pointBackgroundColor" (encodePointProperty Encode.encodeColor) lineChartDataSet.pointBackgroundColor
        |> Encode.maybeCustomField "pointBorderWidth" (encodePointProperty Encode.float) lineChartDataSet.pointBorderWidth
        |> Encode.maybeCustomField "pointRadius" (encodePointProperty Encode.float) lineChartDataSet.pointRadius
        |> Encode.maybeCustomField "pointStyle" (encodePointProperty encodePointStyle) lineChartDataSet.pointStyle
        |> Encode.maybeCustomField "pointRotation" (encodePointProperty Encode.float) lineChartDataSet.pointRotation
        |> Encode.maybeCustomField "pointHitRadius" (encodePointProperty Encode.float) lineChartDataSet.pointHitRadius
        |> Encode.maybeCustomField "pointHoverBackgroundColor" (encodePointProperty Encode.encodeColor) lineChartDataSet.pointHoverBackgroundColor
        |> Encode.maybeCustomField "pointHoverBorderColor" (encodePointProperty Encode.encodeColor) lineChartDataSet.pointHoverBorderColor
        |> Encode.maybeCustomField "pointHoverBorderWidth" (encodePointProperty Encode.float) lineChartDataSet.pointHoverBorderWidth
        |> Encode.maybeCustomField "pointHoverRadius" (encodePointProperty Encode.float) lineChartDataSet.pointHoverRadius
        |> Encode.maybeBoolField "showLine" lineChartDataSet.showLine
        |> Encode.maybeBoolField "spanGaps" lineChartDataSet.spanGaps
        |> Encode.maybeCustomField "steppedLine" encodeSteppedLine lineChartDataSet.steppedLine
        |> Encode.toValue


encodeSteppedLine : Chartjs.DataSets.Line.SteppedLine -> Encode.Value
encodeSteppedLine steppedLine =
    case steppedLine of
        Chartjs.DataSets.Line.NoInterpolation ->
            Encode.bool False

        Chartjs.DataSets.Line.BeforeInterpolation ->
            Encode.string "before"

        Chartjs.DataSets.Line.AfterInterpolation ->
            Encode.string "after"


encodeFillMode : Chartjs.DataSets.Line.FillMode -> Encode.Value
encodeFillMode fillMode =
    case fillMode of
        Chartjs.DataSets.Line.Absolute i ->
            Encode.int i

        Chartjs.DataSets.Line.Relative i ->
            Encode.int i

        -- BUGBUG, possibly needs to be String, '-1', '-2', '+1', ...
        Chartjs.DataSets.Line.Boundary Chartjs.DataSets.Line.Start ->
            Encode.string "start"

        Chartjs.DataSets.Line.Boundary Chartjs.DataSets.Line.End ->
            Encode.string "end"

        Chartjs.DataSets.Line.Boundary Chartjs.DataSets.Line.Origin ->
            Encode.string "origin"

        Chartjs.DataSets.Line.Disabled ->
            Encode.bool False


encodePosition : Common.Position -> Encode.Value
encodePosition position =
    (case position of
        Common.Top ->
            "top"

        Common.Left ->
            "left"

        Common.Bottom ->
            "bottom"

        Common.Right ->
            "right"
    )
        |> Encode.string


encodePointProperty : (a -> Encode.Value) -> Common.PointProperty a -> Encode.Value
encodePointProperty valueEncoder value =
    case value of
        Common.All innerValue ->
            valueEncoder innerValue

        Common.PerPoint valueList ->
            Encode.list valueEncoder valueList


encodePointStyle : Common.PointStyle -> Encode.Value
encodePointStyle pointStyle =
    (case pointStyle of
        Common.Circle ->
            "circle"

        Common.Cross ->
            "cross"

        Common.CrossRot ->
            "crossrot"

        Common.Dash ->
            "dash"

        Common.Line ->
            "line"

        Common.Rect ->
            "rect"

        Common.RectRounded ->
            "rectrounded"

        Common.RectRot ->
            "rectrot"

        Common.Star ->
            "star"

        Common.Triangle ->
            "triangle"

        Common.Image str ->
            "<img src=\"" ++ str ++ "\"/>"
    )
        |> Encode.string


encodeLineCap : Common.LineCap -> Encode.Value
encodeLineCap lineCap =
    (case lineCap of
        Common.LineCapButt ->
            "butt"

        Common.LineCapRound ->
            "round"

        Common.LineCapSquare ->
            "square"
    )
        |> Encode.string


encodeLineJoin : Common.LineJoin -> Encode.Value
encodeLineJoin lineJoin =
    (case lineJoin of
        Common.LineJoinBevel ->
            "bevel"

        Common.LineJoinRound ->
            "round"

        Common.LineJoinMiter ->
            "miter"
    )
        |> Encode.string


encodeData : Chartjs.Data.Data -> Encode.Value
encodeData data =
    Encode.beginObject
        |> Encode.listField "labels" Encode.string data.labels
        |> Encode.listField "datasets" encodeDataset data.datasets
        |> Encode.toValue


encodeDataset : Chartjs.Data.DataSet -> Encode.Value
encodeDataset dataSet =
    case dataSet of
        Chartjs.Data.BarDataSet barChartDataSet ->
            encodeBarChartDataSet barChartDataSet

        Chartjs.Data.LineDataSet lineChartDataSet ->
            encodeLineChartDataSet lineChartDataSet

        Chartjs.Data.DoughnutAndPieDataSet doughnutAndPieDataSet ->
            encodeDoughnutAndPieDataSet doughnutAndPieDataSet


encodeOptions : Chartjs.Options.Options -> Encode.Value
encodeOptions options =
    Encode.beginObject
        |> Encode.maybeCustomField "animations" encodeAnimations options.animations
        |> Encode.maybeCustomField "layout" encodeLayout options.layout
        |> Encode.maybeCustomField "legend" encodeLegend options.legend
        |> Encode.maybeCustomField "title" encodeTitle options.title
        |> Encode.maybeCustomField "tooltips" encodeTooltips options.tooltips
        |> Encode.maybeCustomField "elements" encodeElements options.elements
        |> Encode.maybeCustomField "scales" encodeScales options.scales
        |> Encode.maybeBoolField "maintainAspectRatio" options.maintainAspectRatio
        |> Encode.maybeBoolField "responsive" options.responsive
        |> Encode.toValue


encodeAnimations : Chartjs.Options.Animations.Animations -> Encode.Value
encodeAnimations animations =
    Encode.beginObject
        |> Encode.maybeIntField "duration" animations.duration
        |> Encode.maybeCustomField "easing" encodeEasing animations.easing
        |> Encode.maybeBoolField "animateRotate" animations.animateRotate
        |> Encode.maybeBoolField "animateScale" animations.animateScale
        |> Encode.toValue


encodeEasing : Chartjs.Options.Animations.Easing -> Encode.Value
encodeEasing easing =
    (case easing of
        Chartjs.Options.Animations.EaseLinear ->
            "linear "

        Chartjs.Options.Animations.EaseInQuad ->
            "easeInQuad "

        Chartjs.Options.Animations.EaseOutQuad ->
            "easeOutQuad "

        Chartjs.Options.Animations.EaseInOutQuad ->
            "easeInOutQuad "

        Chartjs.Options.Animations.EaseInCubic ->
            "easeInCubic "

        Chartjs.Options.Animations.EaseOutCubic ->
            "easeOutCubic "

        Chartjs.Options.Animations.EaseInOutCubic ->
            "easeInOutCubic "

        Chartjs.Options.Animations.EaseInQuart ->
            "easeInQuart "

        Chartjs.Options.Animations.EaseOutQuart ->
            "easeOutQuart "

        Chartjs.Options.Animations.EaseInOutQuart ->
            "easeInOutQuart "

        Chartjs.Options.Animations.EaseInQuint ->
            "easeInQuint "

        Chartjs.Options.Animations.EaseOutQuint ->
            "easeOutQuint "

        Chartjs.Options.Animations.EaseInOutQuint ->
            "easeInOutQuint "

        Chartjs.Options.Animations.EaseInSine ->
            "easeInSine "

        Chartjs.Options.Animations.EaseOutSine ->
            "easeOutSine "

        Chartjs.Options.Animations.EaseInOutSine ->
            "easeInOutSine "

        Chartjs.Options.Animations.EaseInExpo ->
            "easeInExpo "

        Chartjs.Options.Animations.EaseOutExpo ->
            "easeOutExpo "

        Chartjs.Options.Animations.EaseInOutExpo ->
            "easeInOutExpo "

        Chartjs.Options.Animations.EaseInCirc ->
            "easeInCirc "

        Chartjs.Options.Animations.EaseOutCirc ->
            "easeOutCirc "

        Chartjs.Options.Animations.EaseInOutCirc ->
            "easeInOutCirc "

        Chartjs.Options.Animations.EaseInElastic ->
            "easeInElastic "

        Chartjs.Options.Animations.EaseOutElastic ->
            "easeOutElastic "

        Chartjs.Options.Animations.EaseInOutElastic ->
            "easeInOutElastic "

        Chartjs.Options.Animations.EaseInBack ->
            "easeInBack "

        Chartjs.Options.Animations.EaseOutBack ->
            "easeOutBack "

        Chartjs.Options.Animations.EaseInOutBack ->
            "easeInOutBack "

        Chartjs.Options.Animations.EaseInBounce ->
            "easeInBounce "

        Chartjs.Options.Animations.EaseOutBounce ->
            "easeOutBounce "

        Chartjs.Options.Animations.EaseInOutBounce ->
            "easeInOutBounce "
    )
        |> Encode.string


encodeElements : Chartjs.Options.Elements.Elements -> Encode.Value
encodeElements elements =
    Encode.beginObject
        |> Encode.maybeCustomField "point" encodePoint elements.point
        |> Encode.maybeCustomField "line" encodeLine elements.line
        |> Encode.maybeCustomField "rectangle" encodeRectangle elements.rectangle
        |> Encode.maybeCustomField "arc" encodeArc elements.arc
        |> Encode.toValue


encodePoint : Chartjs.Options.Elements.Point -> Encode.Value
encodePoint point =
    Encode.beginObject
        |> Encode.maybeIntField "radius" point.radius
        |> Encode.maybeCustomField "pointStyle" encodePointStyle point.pointStyle
        |> Encode.maybeIntField "rotation" point.rotation
        |> Encode.maybeColorField "backgroundColor" point.backgroundColor
        |> Encode.maybeIntField "borderWidth" point.borderWidth
        |> Encode.maybeColorField "borderColor" point.borderColor
        |> Encode.maybeIntField "hitRadius" point.hitRadius
        |> Encode.maybeIntField "hoverRadius" point.hoverRadius
        |> Encode.maybeIntField "hoverBorderWidth" point.hoverBorderWidth
        |> Encode.toValue


encodeLine : Chartjs.Options.Elements.Line -> Encode.Value
encodeLine line =
    Encode.beginObject
        |> Encode.maybeFloatField "tension" line.tension
        |> Encode.maybeColorField "backgroundColor" line.backgroundColor
        |> Encode.maybeIntField "borderWidth" line.borderWidth
        |> Encode.maybeColorField "borderColor" line.borderColor
        |> Encode.maybeCustomField "borderCapStyle" encodeLineCap line.borderCapStyle
        |> Encode.maybeListField "borderDash" Encode.int line.borderDash
        |> Encode.maybeIntField "borderDashOffset" line.borderDashOffset
        |> Encode.maybeCustomField "borderJoinStyle" encodeLineJoin line.borderJoinStyle
        |> Encode.maybeBoolField "capBezierPoints" line.capBezierPoints
        |> Encode.maybeCustomField "fill" encodeLineFill line.fill
        |> Encode.maybeBoolField "stepped" line.stepped
        |> Encode.toValue


encodeLineFill : Chartjs.Options.Elements.LineFill -> Encode.Value
encodeLineFill lineFill =
    case lineFill of
        Chartjs.Options.Elements.Zero ->
            Encode.string "zero"

        Chartjs.Options.Elements.Top ->
            Encode.string "top"

        Chartjs.Options.Elements.Bottom ->
            Encode.string "bottom"

        Chartjs.Options.Elements.NoFill ->
            Encode.bool False


encodeRectangle : Chartjs.Options.Elements.Rectangle -> Encode.Value
encodeRectangle rectangle =
    Encode.beginObject
        |> Encode.maybeColorField "backgroundColor" rectangle.backgroundColor
        |> Encode.maybeIntField "borderWidth" rectangle.borderWidth
        |> Encode.maybeColorField "borderColor" rectangle.borderColor
        |> Encode.maybeCustomField "borderSkipped" encodePosition rectangle.borderSkipped
        |> Encode.toValue


encodeArc : Chartjs.Options.Elements.Arc -> Encode.Value
encodeArc arc =
    Encode.beginObject
        |> Encode.maybeColorField "backgroundColor" arc.backgroundColor
        |> Encode.maybeColorField "borderColor" arc.borderColor
        |> Encode.maybeIntField "borderWidth" arc.borderWidth
        |> Encode.toValue


encodeLayout : Chartjs.Options.Layout.Layout -> Encode.Value
encodeLayout layout =
    case layout of
        Chartjs.Options.Layout.Uniform i ->
            Encode.int i

        Chartjs.Options.Layout.Specific { left, right, top, bottom } ->
            Encode.beginObject
                |> Encode.intField "left" left
                |> Encode.intField "right" right
                |> Encode.intField "top" top
                |> Encode.intField "bottom" bottom
                |> Encode.toValue


encodeLabels : Chartjs.Options.Legend.Labels -> Encode.Value
encodeLabels labels =
    Encode.beginObject
        |> Encode.maybeIntField "boxWidth" labels.boxWidth
        |> Encode.maybeIntField "fontSize" labels.fontSize
        |> Encode.maybeStringField "fontStyle" labels.fontStyle
        |> Encode.maybeColorField "fontColor" labels.fontColor
        |> Encode.maybeStringField "fontFamily" labels.fontFamily
        |> Encode.maybeIntField "padding" labels.padding
        |> Encode.maybeBoolField "usePointStyle" labels.usePointStyle
        |> Encode.toValue


encodeLegend : Chartjs.Options.Legend.Legend -> Encode.Value
encodeLegend legend =
    Encode.beginObject
        |> Encode.maybeBoolField "display" legend.display
        |> Encode.maybeCustomField "position" encodePosition legend.position
        |> Encode.maybeBoolField "fullWidth" legend.fullWidth
        -- onClick,
        -- onHover,
        |> Encode.maybeBoolField "reverse" legend.reverse
        |> Encode.maybeCustomField "labels" encodeLabels legend.labels
        |> Encode.toValue


encodeScales : Chartjs.Options.Scales.Scales -> Encode.Value
encodeScales scales =
    Encode.beginObject
        |> Encode.listField "xAxes" encodeAxis scales.xAxes
        |> Encode.listField "yAxes" encodeAxis scales.yAxes
        |> Encode.toValue


encodeAxis : Chartjs.Options.Scales.Axis -> Encode.Value
encodeAxis axis =
    Encode.beginObject
        |> Encode.maybeCustomField "position" encodePosition axis.position
        |> Encode.maybeBoolField "stacked" axis.stacked
        |> Encode.maybeCustomField "ticks" encodeTicks axis.ticks
        |> Encode.maybeCustomField "gridLines" encodeGridLines axis.gridLines
        |> Encode.toValue


encodeTicks : Chartjs.Options.Scales.Ticks -> Encode.Value
encodeTicks ticks =
    Encode.beginObject
        |> Encode.maybeStringField "fontFamily" ticks.fontFamily
        |> Encode.maybeStringField "callback" ticks.callback
        |> Encode.maybeBoolField "beginAtZero" ticks.beginAtZero
        |> Encode.maybeFloatField "min" ticks.min
        |> Encode.maybeFloatField "max" ticks.max
        |> Encode.maybeIntField "maxTicksLimit" ticks.maxTicksLimit
        |> Encode.maybeIntField "precision" ticks.precision
        |> Encode.maybeFloatField "stepSize" ticks.stepSize
        |> Encode.maybeFloatField "suggestedMax" ticks.suggestedMax
        |> Encode.maybeFloatField "suggestedMin" ticks.suggestedMin
        |> Encode.toValue


encodeGridLines : Chartjs.Options.Scales.GridLines -> Encode.Value
encodeGridLines gridLines =
    Encode.beginObject
        |> Encode.maybeBoolField "display" gridLines.display
        |> Encode.maybeCustomField "color" (encodePointProperty Encode.encodeColor) gridLines.color
        |> Encode.toValue


encodeTitle : Chartjs.Options.Title.Title -> Encode.Value
encodeTitle title =
    Encode.beginObject
        |> Encode.maybeBoolField "display" title.display
        |> Encode.maybeCustomField "position" encodePosition title.position
        |> Encode.maybeIntField "fontSize" title.fontSize
        |> Encode.maybeStringField "fontFamily" title.fontFamily
        |> Encode.maybeColorField "fontColor" title.fontColor
        |> Encode.maybeStringField "fontStyle" title.fontStyle
        |> Encode.maybeIntField "padding" title.padding
        |> Encode.maybeStringField "lineHeight" title.lineHeight
        |> Encode.maybeStringField "text" title.text
        |> Encode.toValue


encodeTooltips : Chartjs.Options.Tooltips.Tooltips -> Encode.Value
encodeTooltips tooltips =
    Encode.beginObject
        |> Encode.maybeBoolField "enabled" tooltips.enabled
        |> Encode.maybeCustomField "mode" encodeMode tooltips.mode
        |> Encode.maybeBoolField "intersect" tooltips.intersect
        |> Encode.maybeCustomField "position" encodePositionMode tooltips.position
        |> Encode.maybeCustomField "callbacks" encodeCallbacks tooltips.callbacks
        |> Encode.maybeColorField "backgroundColor" tooltips.backgroundColor
        |> Encode.maybeStringField "titleFontFamily" tooltips.titleFontFamily
        |> Encode.maybeIntField "titleFontSize" tooltips.titleFontSize
        |> Encode.maybeStringField "titleFontStyle" tooltips.titleFontStyle
        |> Encode.maybeColorField "titleFontColor" tooltips.titleFontColor
        |> Encode.maybeIntField "titleSpacing" tooltips.titleSpacing
        |> Encode.maybeIntField "titleMarginBottom" tooltips.titleMarginBottom
        |> Encode.maybeStringField "bodyFontFamily" tooltips.bodyFontFamily
        |> Encode.maybeIntField "bodyFontSize" tooltips.bodyFontSize
        |> Encode.maybeStringField "bodyFontStyle" tooltips.bodyFontStyle
        |> Encode.maybeColorField "bodyFontColor" tooltips.bodyFontColor
        |> Encode.maybeIntField "bodySpacing" tooltips.bodySpacing
        |> Encode.maybeStringField "footerFontFamily" tooltips.footerFontFamily
        |> Encode.maybeIntField "footerFontSize" tooltips.footerFontSize
        |> Encode.maybeStringField "footerFontStyle" tooltips.footerFontStyle
        |> Encode.maybeColorField "footerFontColor" tooltips.footerFontColor
        |> Encode.maybeIntField "footerSpacing" tooltips.footerSpacing
        |> Encode.maybeIntField "footerMarginTop" tooltips.footerMarginTop
        |> Encode.maybeIntField "xPadding" tooltips.xPadding
        |> Encode.maybeIntField "yPadding" tooltips.yPadding
        |> Encode.maybeIntField "caretPadding" tooltips.caretPadding
        |> Encode.maybeIntField "carretSize" tooltips.carretSize
        |> Encode.maybeIntField "cornerRadius" tooltips.cornerRadius
        |> Encode.maybeColorField "multiKeyBackground" tooltips.multiKeyBackground
        |> Encode.maybeBoolField "displayColors" tooltips.displayColors
        |> Encode.maybeBoolField "borderColor" tooltips.borderColor
        |> Encode.maybeIntField "borderWidth" tooltips.borderWidth
        |> Encode.toValue


encodeMode : Chartjs.Options.Tooltips.Mode -> Encode.Value
encodeMode mode =
    (case mode of
        Chartjs.Options.Tooltips.Point ->
            "point"

        Chartjs.Options.Tooltips.Nearest ->
            "nearest"

        Chartjs.Options.Tooltips.Index ->
            "index"

        Chartjs.Options.Tooltips.DataSet ->
            "dataset"

        Chartjs.Options.Tooltips.X ->
            "x"

        Chartjs.Options.Tooltips.Y ->
            "y"
    )
        |> Encode.string


encodePositionMode : Chartjs.Options.Tooltips.PositionMode -> Encode.Value
encodePositionMode positionMode =
    (case positionMode of
        Chartjs.Options.Tooltips.PositionModeAverage ->
            "average"

        Chartjs.Options.Tooltips.PositionModeNearest ->
            "nearest"
    )
        |> Encode.string


encodeCallbacks : Chartjs.Options.Tooltips.Callbacks -> Encode.Value
encodeCallbacks callbacks =
    Encode.beginObject
        |> Encode.maybeStringField "label" callbacks.label
        |> Encode.toValue

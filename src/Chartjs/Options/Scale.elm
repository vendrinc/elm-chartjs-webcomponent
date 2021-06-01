module Chartjs.Options.Scale exposing
    ( ScaleType(..), Scale, defaultScale
    , setAxis, setPosition, setReverse, setMin, setMax, setSuggestedMin, setSuggestedMax, setGrid, setTitle
    , ScaleGrid, defaultGrid, setBorderColor, setBorderWidth, setDrawBorder, setDrawTicks, setGridColor, setTickColor, setTickLength, setTickWidth
    , ScaleTitle, defaultTitle, setTitleColor, setTitleFont, setTitlePadding
    )

{-| Axes are an integral part of a chart.

For more information, see <<https://www.chartjs.org/docs/3.3.2/axes/>

@docs ScaleType, Scale, defaultScale
@docs setAxis, setPosition, setReverse, setMin, setMax, setSuggestedMin, setSuggestedMax, setGrid, setTitle

@docs ScaleGrid, defaultGrid, setBorderColor, setBorderWidth, setDrawBorder, setDrawTicks, setGridColor, setTickColor, setTickLength, setTickWidth
@docs ScaleTitle, defaultTitle, setTitleColor, setTitleFont, setTitlePadding

-}

import Chartjs.Common as Common
import Chartjs.Options.Font exposing (FontSpec)
import Color exposing (Color)


{-| -}
type alias Scale =
    { id : String
    , type_ : ScaleType
    , axis : Maybe Common.IndexAxis
    , position : Maybe Common.Position
    , reverse : Maybe Bool
    , min : Maybe Float
    , max : Maybe Float
    , suggestedMin : Maybe Float
    , suggestedMax : Maybe Float
    , grid : Maybe ScaleGrid
    , title : Maybe ScaleTitle
    }


{-| Given a scale type and an ID, creates an empty scale object

It's best practice to set the ID of your scales to "x" or "y", depending on what axis you need
For more complicated use cases, you can assign these objects to datasets using the XAxisID / YAxisID properties

-}
defaultScale : ScaleType -> String -> Scale
defaultScale type_ id =
    { id = id
    , type_ = type_
    , axis = Nothing
    , position = Nothing
    , reverse = Nothing
    , min = Nothing
    , max = Nothing
    , suggestedMin = Nothing
    , suggestedMax = Nothing
    , grid = Nothing
    , title = Nothing
    }


{-| Set the axis for this scale - is this an X axis or a Y axis?

If this is not set, Chartjs will try and guess based on the first letter of your axis ID
For best practices, you should set this explicitly!

-}
setAxis : Common.IndexAxis -> Scale -> Scale
setAxis axis scale =
    { scale | axis = Just axis }


{-| Set the position of this scale
-}
setPosition : Common.Position -> Scale -> Scale
setPosition position scale =
    { scale | position = Just position }


{-| Set whether the ticks on this scale should be reversed
-}
setReverse : Bool -> Scale -> Scale
setReverse reverse scale =
    { scale | reverse = Just reverse }


{-| Set the minimum value for this scale
This will override the minimum value from the data
-}
setMin : Float -> Scale -> Scale
setMin min scale =
    { scale | min = Just min }


{-| Set the maximum value for this scale
This will override the maximum value from the data
-}
setMax : Float -> Scale -> Scale
setMax max scale =
    { scale | max = Just max }


{-| Set a suggestion, used when calculating the minimum extent
-}
setSuggestedMin : Float -> Scale -> Scale
setSuggestedMin min scale =
    { scale | min = Just min }


{-| Set a suggestion, used when calculating the maximum extent
-}
setSuggestedMax : Float -> Scale -> Scale
setSuggestedMax max scale =
    { scale | max = Just max }


{-| Set the grid properties for this scale
-}
setGrid : ScaleGrid -> Scale -> Scale
setGrid grid scale =
    { scale | grid = Just grid }


{-| Set the title properties for this scale
-}
setTitle : ScaleTitle -> Scale -> Scale
setTitle title scale =
    { scale | title = Just title }


{-| Linear and logarithmic scales work best

For categorical scales, you're probably best using a data object with labels set
For time scales, good luck

-}
type ScaleType
    = Linear
    | Logarithmic
    | Categorical
    | Time
    | RadialLinear


{-| Styling properties for the grid lines of a scale
-}
type alias ScaleGrid =
    { borderColor : Maybe Color
    , borderWidth : Maybe Int
    , gridColor : Maybe Color
    , drawBorder : Maybe Bool
    , drawTicks : Maybe Bool
    , tickColor : Maybe Color
    , tickLength : Maybe Int
    , tickWidth : Maybe Int
    }


{-| Create a blank grid properties object that can then be manipulated
-}
defaultGrid : ScaleGrid
defaultGrid =
    { borderColor = Nothing
    , borderWidth = Nothing
    , gridColor = Nothing
    , drawBorder = Nothing
    , drawTicks = Nothing
    , tickColor = Nothing
    , tickLength = Nothing
    , tickWidth = Nothing
    }


{-| Set the edge border color
-}
setBorderColor : Color -> ScaleGrid -> ScaleGrid
setBorderColor color grid =
    { grid | borderColor = Just color }


{-| Set the edge border width
-}
setBorderWidth : Int -> ScaleGrid -> ScaleGrid
setBorderWidth width grid =
    { grid | borderWidth = Just width }


{-| Set the color of grid lines
-}
setGridColor : Color -> ScaleGrid -> ScaleGrid
setGridColor color grid =
    { grid | gridColor = Just color }


{-| Set whether the border should be drawn
-}
setDrawBorder : Bool -> ScaleGrid -> ScaleGrid
setDrawBorder bool grid =
    { grid | drawBorder = Just bool }


{-| Set whether to draw the tick dashes
-}
setDrawTicks : Bool -> ScaleGrid -> ScaleGrid
setDrawTicks bool grid =
    { grid | drawTicks = Just bool }


{-| Set the color of the tick dashes
-}
setTickColor : Color -> ScaleGrid -> ScaleGrid
setTickColor color grid =
    { grid | tickColor = Just color }


{-| Set the length (how far into the chart they extend) of tick dashes
-}
setTickLength : Int -> ScaleGrid -> ScaleGrid
setTickLength length grid =
    { grid | tickLength = Just length }


{-| Set the width of tick dashes
-}
setTickWidth : Int -> ScaleGrid -> ScaleGrid
setTickWidth width grid =
    { grid | tickWidth = Just width }


{-| Scale titles are used for labelling the graph axes
-}
type alias ScaleTitle =
    { text : String
    , color : Maybe Color
    , font : Maybe FontSpec
    , padding : Maybe Int
    }


{-| Create a basic title from the given text
-}
defaultTitle : String -> ScaleTitle
defaultTitle text =
    { text = text
    , color = Nothing
    , font = Nothing
    , padding = Nothing
    }


{-| Set the text color for this title
-}
setTitleColor : Color -> ScaleTitle -> ScaleTitle
setTitleColor color title =
    { title | color = Just color }


{-| Set the padding around the title text
-}
setTitlePadding : Int -> ScaleTitle -> ScaleTitle
setTitlePadding padding title =
    { title | padding = Just padding }


{-| Set the font properties for this title text
-}
setTitleFont : FontSpec -> ScaleTitle -> ScaleTitle
setTitleFont font title =
    { title | font = Just font }

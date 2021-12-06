module Chartjs.Options.Tooltips exposing
    ( Tooltips, defaultTooltips
    , PositionMode(..), Mode(..)
    , setBackgroundColor, setEnabled, setIntersect, setMode, setPosition
    , LabelFormat(..), setLabelPrefix, setLabelSuffix
    , TooltipTextAlign(..)
    , setTitleColor, setTitleFont, setTitleAlign, setTitleSpacing, setTitleMarginBottom
    , setBodyColor, setBodyFont, setBodyAlign, setBodySpacing
    , setFooterText, setFooterColor, setFooterFont, setFooterAlign, setFooterSpacing, setFooterMarginTop
    , setCaretPadding, setCaretSize
    , setCornerRadius, setBorderColor, setBorderWidth
    , setMultiKeyBackground, setDisplayColors
    )

{-| For more information, see <https://www.chartjs.org/docs/latest/configuration/tooltip.html>

@docs Tooltips, defaultTooltips

@docs PositionMode, Mode

@docs setBackgroundColor, setEnabled, setIntersect, setMode, setPosition


## Label Formatting

While most of the Chart.js callbacks aren't supported, there's a couple of helpers for formatting labels.

@docs LabelFormat, setLabelPrefix, setLabelSuffix


## Titles & Text

@docs TooltipTextAlign

@docs setTitleColor, setTitleFont, setTitleAlign, setTitleSpacing, setTitleMarginBottom

@docs setBodyColor, setBodyFont, setBodyAlign, setBodySpacing

@docs setFooterText, setFooterColor, setFooterFont, setFooterAlign, setFooterSpacing, setFooterMarginTop

@docs setCaretPadding, setCaretSize


## Tooltip Borders

@docs setCornerRadius, setBorderColor, setBorderWidth


## Other Properties

@docs setMultiKeyBackground, setDisplayColors

-}

import Chartjs.Options.Font exposing (FontSpec)
import Color exposing (Color)


{-| Tooltips are displayed when interacting with charts
-}
type alias Tooltips =
    { enabled : Maybe Bool
    , mode : Maybe Mode
    , intersect : Maybe Bool
    , position : Maybe PositionMode
    , labelFormat : Maybe LabelFormat
    , backgroundColor : Maybe Color
    , titleColor : Maybe Color
    , titleFont : Maybe FontSpec
    , titleAlign : Maybe TooltipTextAlign
    , titleSpacing : Maybe Int
    , titleMarginBottom : Maybe Int
    , bodyColor : Maybe Color
    , bodyFont : Maybe FontSpec
    , bodyAlign : Maybe TooltipTextAlign
    , bodySpacing : Maybe Int
    , footerText : Maybe String
    , footerColor : Maybe Color
    , footerFont : Maybe FontSpec
    , footerAlign : Maybe TooltipTextAlign
    , footerSpacing : Maybe Int
    , footerMarginTop : Maybe Int
    , caretPadding : Maybe Int
    , caretSize : Maybe Int
    , cornerRadius : Maybe Int
    , multiKeyBackground : Maybe Color
    , displayColors : Maybe Bool
    , borderColor : Maybe Color
    , borderWidth : Maybe Int
    }


{-| How to align tooltip text

This is different to the Common.Align type for some reason - sorry.

-}
type TooltipTextAlign
    = Left
    | Right
    | Center


{-| Positioning mode for tooltips

Average will place the tooltip at the average position of the displayed items
Nearest will place the tooltip at the element closest to the event position

-}
type PositionMode
    = PositionModeAverage
    | PositionModeNearest


{-| Controls what elements are displayed in the tooltip
Point: finds all items that intersect the point
Nearest: gets the items that are at the nearest distance to the point
Index: finds item at the same index
X: find all items that interesct (based on X axis only)
Y: find all items that intersect (based on Y axis only)
-}
type Mode
    = Point
    | Nearest
    | Index
    | DataSet
    | X
    | Y


{-| Use setLabelPrefix and setLabelSuffix instead of this directly
-}
type LabelFormat
    = Prefix String
    | Suffix String


{-| Create a blank tooltips object
-}
defaultTooltips : Tooltips
defaultTooltips =
    { enabled = Nothing
    , mode = Nothing
    , intersect = Nothing
    , position = Nothing
    , labelFormat = Nothing
    , backgroundColor = Nothing
    , titleColor = Nothing
    , titleFont = Nothing
    , titleAlign = Nothing
    , titleSpacing = Nothing
    , titleMarginBottom = Nothing
    , bodyColor = Nothing
    , bodyFont = Nothing
    , bodyAlign = Nothing
    , bodySpacing = Nothing
    , footerText = Nothing
    , footerColor = Nothing
    , footerFont = Nothing
    , footerAlign = Nothing
    , footerSpacing = Nothing
    , footerMarginTop = Nothing
    , caretPadding = Nothing
    , caretSize = Nothing
    , cornerRadius = Nothing
    , multiKeyBackground = Nothing
    , displayColors = Nothing
    , borderColor = Nothing
    , borderWidth = Nothing
    }


{-| Set whether tooltips are enabled or not
-}
setEnabled : Bool -> Tooltips -> Tooltips
setEnabled enabled tooltip =
    { tooltip | enabled = Just enabled }


{-| Set the tooltip mode

Check the [Chart.js docs](https://www.chartjs.org/docs/latest/configuration/interactions.html#modes)

-}
setMode : Mode -> Tooltips -> Tooltips
setMode mode tooltip =
    { tooltip | mode = Just mode }


{-| If true, the tooltip mode applies only when the mouse position intersects.
If false, the tooltip mode will be applied at all types.
-}
setIntersect : Bool -> Tooltips -> Tooltips
setIntersect intersect tooltip =
    { tooltip | intersect = Just intersect }


{-| Set how the tooltip should be positioned - see the PositionMode type for more details
-}
setPosition : PositionMode -> Tooltips -> Tooltips
setPosition position tooltip =
    { tooltip | position = Just position }


{-| Set a prefix that should be added to all labels in the tooltip

example: To format values as currency:

    defaultTooltips
        |> setLabelPrefix "$"

-}
setLabelPrefix : String -> Tooltips -> Tooltips
setLabelPrefix prefix tooltip =
    { tooltip | labelFormat = Just <| Prefix prefix }


{-| Set a suffix that should be added to all labels in the tooltip

example: To format values as percentages:

    defaultTooltips
        |> setLabelSuffix "%"

-}
setLabelSuffix : String -> Tooltips -> Tooltips
setLabelSuffix suffix tooltip =
    { tooltip | labelFormat = Just <| Suffix suffix }


{-| Set the background color of the tooltip
-}
setBackgroundColor : Color -> Tooltips -> Tooltips
setBackgroundColor color tooltip =
    { tooltip | backgroundColor = Just color }


{-| Set the color of the title text
-}
setTitleColor : Color -> Tooltips -> Tooltips
setTitleColor color tooltip =
    { tooltip | titleColor = Just color }


{-| Set the font properties for the title text
-}
setTitleFont : FontSpec -> Tooltips -> Tooltips
setTitleFont font tooltip =
    { tooltip | titleFont = Just font }


{-| Set the text alignment for the title
-}
setTitleAlign : TooltipTextAlign -> Tooltips -> Tooltips
setTitleAlign align tooltip =
    { tooltip | titleAlign = Just align }


{-| Set the spacing to add around each title line
-}
setTitleSpacing : Int -> Tooltips -> Tooltips
setTitleSpacing spacing tooltip =
    { tooltip | titleSpacing = Just spacing }


{-| Set the margin on the bottom of the title
-}
setTitleMarginBottom : Int -> Tooltips -> Tooltips
setTitleMarginBottom margin tooltip =
    { tooltip | titleMarginBottom = Just margin }


{-| Set the color of the body text
-}
setBodyColor : Color -> Tooltips -> Tooltips
setBodyColor color tooltip =
    { tooltip | bodyColor = Just color }


{-| Set the font properties for the body text
-}
setBodyFont : FontSpec -> Tooltips -> Tooltips
setBodyFont font tooltip =
    { tooltip | bodyFont = Just font }


{-| Set the text alignment for the body text
-}
setBodyAlign : TooltipTextAlign -> Tooltips -> Tooltips
setBodyAlign align tooltip =
    { tooltip | titleAlign = Just align }


{-| Set the spacing to add around each tooltip item
-}
setBodySpacing : Int -> Tooltips -> Tooltips
setBodySpacing spacing tooltip =
    { tooltip | bodySpacing = Just spacing }


{-| Set the content for the footer
-}
setFooterText : String -> Tooltips -> Tooltips
setFooterText footer tooltip =
    { tooltip | footerText = Just footer }


{-| Set the color of the footer text
-}
setFooterColor : Color -> Tooltips -> Tooltips
setFooterColor color tooltip =
    { tooltip | footerColor = Just color }


{-| Set the font properties for the footer text
-}
setFooterFont : FontSpec -> Tooltips -> Tooltips
setFooterFont font tooltip =
    { tooltip | footerFont = Just font }


{-| Set the text alignment for the footer text
-}
setFooterAlign : TooltipTextAlign -> Tooltips -> Tooltips
setFooterAlign align tooltip =
    { tooltip | footerAlign = Just align }


{-| Set the spacing to add around each footer line
-}
setFooterSpacing : Int -> Tooltips -> Tooltips
setFooterSpacing spacing tooltip =
    { tooltip | footerSpacing = Just spacing }


{-| Set the margin on the top of the footer
-}
setFooterMarginTop : Int -> Tooltips -> Tooltips
setFooterMarginTop margin tooltip =
    { tooltip | footerMarginTop = Just margin }


{-| Set the padding for the caret - how far away to move the tooltip arrow from the tooltip point
-}
setCaretPadding : Int -> Tooltips -> Tooltips
setCaretPadding padding tooltip =
    { tooltip | caretPadding = Just padding }


{-| Set the size (in pixels) of the tooltip arrow
-}
setCaretSize : Int -> Tooltips -> Tooltips
setCaretSize size tooltip =
    { tooltip | caretSize = Just size }


{-| Set the radius of the tooltip corners
-}
setCornerRadius : Int -> Tooltips -> Tooltips
setCornerRadius radius tooltip =
    { tooltip | cornerRadius = Just radius }


{-| Set the color to draw behind the colored boxes when multiple items are in the tooltip
-}
setMultiKeyBackground : Color -> Tooltips -> Tooltips
setMultiKeyBackground color tooltip =
    { tooltip | multiKeyBackground = Just color }


{-| Set whether color boxes are shown in the tooltip
-}
setDisplayColors : Bool -> Tooltips -> Tooltips
setDisplayColors display tooltip =
    { tooltip | displayColors = Just display }


{-| Set the color of the tooltip border
-}
setBorderColor : Color -> Tooltips -> Tooltips
setBorderColor color tooltip =
    { tooltip | borderColor = Just color }


{-| Set the width of the tooltip border
-}
setBorderWidth : Int -> Tooltips -> Tooltips
setBorderWidth width tooltip =
    { tooltip | borderWidth = Just width }

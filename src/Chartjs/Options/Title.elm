module Chartjs.Options.Title exposing
    ( Title, defaultTitle
    , setDisplay, setPosition, setFontSize, setFontFamily, setFontColor, setFontStyle, setPadding, setLineHeight, setText
    )

{-| For more information, see <https://www.chartjs.org/docs/latest/configuration/title.html>

@docs Title, defaultTitle
@docs setDisplay, setPosition, setFontSize, setFontFamily, setFontColor, setFontStyle, setPadding, setLineHeight, setText

-}

import Chartjs.Common as Common
import Color exposing (Color)


{-| The Title is text that is drawn outside of the Chart
-}
type alias Title =
    { display : Maybe Bool
    , position : Maybe Common.Position
    , fontSize : Maybe Int
    , fontFamily : Maybe String
    , fontColor : Maybe Color
    , fontStyle : Maybe String
    , padding : Maybe Int
    , lineHeight : Maybe String
    , text : Maybe String
    }


{-| Create a blank title object
-}
defaultTitle : Title
defaultTitle =
    { display = Nothing
    , position = Nothing
    , fontSize = Nothing
    , fontFamily = Nothing
    , fontColor = Nothing
    , fontStyle = Nothing
    , padding = Nothing
    , lineHeight = Nothing
    , text = Nothing
    }


{-| Is the title shown?
-}
setDisplay : Bool -> Title -> Title
setDisplay bool title =
    { title | display = Just bool }


{-| Position of the title
-}
setPosition : Common.Position -> Title -> Title
setPosition position title =
    { title | position = Just position }


{-| Size of the title text
-}
setFontSize : Int -> Title -> Title
setFontSize size title =
    { title | fontSize = Just size }


{-| Font family for the title text
-}
setFontFamily : String -> Title -> Title
setFontFamily family title =
    { title | fontFamily = Just family }


{-| Font color for the title text
-}
setFontColor : Color -> Title -> Title
setFontColor color title =
    { title | fontColor = Just color }


{-| Font style for the title text
eg. normal, bold, italic
-}
setFontStyle : String -> Title -> Title
setFontStyle style title =
    { title | fontStyle = Just style }


{-| Padding (in pixels) above and below the title text
-}
setPadding : Int -> Title -> Title
setPadding padding title =
    { title | padding = Just padding }


{-| Height of each individual line of text
See <https://developer.mozilla.org/en-US/docs/Web/CSS/line-height>
-}
setLineHeight : String -> Title -> Title
setLineHeight height title =
    { title | lineHeight = Just height }


{-| Title text to be displayed
-}
setText : String -> Title -> Title
setText text title =
    { title | text = Just text }

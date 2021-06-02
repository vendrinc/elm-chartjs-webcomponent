module Chartjs.Options.Title exposing
    ( Title, defaultTitle
    , setDisplay, setAlign, setPosition, setPadding, setText, setFont, setColor
    )

{-| For more information, see <https://www.chartjs.org/docs/latest/configuration/title.html>

@docs Title, defaultTitle
@docs setDisplay, setAlign, setPosition, setPadding, setText, setFont, setColor

-}

import Chartjs.Common as Common
import Chartjs.Options.Font exposing (FontSpec)
import Color exposing (Color)


{-| The Title is text that is drawn outside of the Chart
-}
type alias Title =
    { display : Maybe Bool
    , align : Maybe Common.Align
    , position : Maybe Common.Position
    , padding : Maybe Int
    , text : Maybe String
    , font : Maybe FontSpec
    , color : Maybe Color
    }


{-| Create a blank title object
-}
defaultTitle : Title
defaultTitle =
    { display = Nothing
    , align = Nothing
    , position = Nothing
    , padding = Nothing
    , text = Nothing
    , font = Nothing
    , color = Nothing
    }


{-| Is the title shown?
-}
setDisplay : Bool -> Title -> Title
setDisplay bool title =
    { title | display = Just bool }


{-| Text alignment of the title
-}
setAlign : Common.Align -> Title -> Title
setAlign align title =
    { title | align = Just align }


{-| Position of the title
-}
setPosition : Common.Position -> Title -> Title
setPosition position title =
    { title | position = Just position }


{-| Padding (in pixels) above and below the title text
-}
setPadding : Int -> Title -> Title
setPadding padding title =
    { title | padding = Just padding }


{-| Title text to be displayed
-}
setText : String -> Title -> Title
setText text title =
    { title | text = Just text }


{-| Color for the title text
-}
setColor : Color -> Title -> Title
setColor color title =
    { title | color = Just color }


{-| Font properties to use for the title text
-}
setFont : FontSpec -> Title -> Title
setFont font title =
    { title | font = Just font }

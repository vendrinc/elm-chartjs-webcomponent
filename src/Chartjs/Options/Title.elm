module Chartjs.Options.Title exposing
    ( Title
    , defaultTitle
    , setDisplay
    , setFontColor
    , setFontFamily
    , setFontSize
    , setFontStyle
    , setLineHeight
    , setPadding
    , setPosition
    , setText
    )

import Chartjs.Common as Common
import Color exposing (Color)


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


setDisplay : Bool -> Title -> Title
setDisplay bool title =
    { title | display = Just bool }


setPosition : Common.Position -> Title -> Title
setPosition position title =
    { title | position = Just position }


setFontSize : Int -> Title -> Title
setFontSize size title =
    { title | fontSize = Just size }


setFontFamily : String -> Title -> Title
setFontFamily family title =
    { title | fontFamily = Just family }


setFontColor : Color -> Title -> Title
setFontColor color title =
    { title | fontColor = Just color }


setFontStyle : String -> Title -> Title
setFontStyle style title =
    { title | fontStyle = Just style }


setPadding : Int -> Title -> Title
setPadding padding title =
    { title | padding = Just padding }


setLineHeight : String -> Title -> Title
setLineHeight height title =
    { title | lineHeight = Just height }


setText : String -> Title -> Title
setText text title =
    { title | text = Just text }

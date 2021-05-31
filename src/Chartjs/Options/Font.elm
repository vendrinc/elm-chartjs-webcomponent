module Chartjs.Options.Font exposing
    ( FontSpec, defaultFont, create
    , setFamily, setLineHeight, setSize, setStyle, setWeight
    )

{-| For more information, see <https://www.chartjs.org/docs/3.3.2/api/interfaces/fontspec.html>

@docs FontSpec, defaultFont, create

@docs setFamily, setLineHeight, setSize, setStyle, setWeight

-}


{-| A font spec object controls how various chart text is rendered
This can be applied to things such as labels, legends, titles, etc.
-}
type alias FontSpec =
    { family : Maybe String
    , lineHeight : Maybe Float
    , size : Maybe Int
    , style : Maybe String
    , weight : Maybe String
    }


{-| Create a blank font object that can then be updated with the below functions
-}
defaultFont : FontSpec
defaultFont =
    { family = Nothing
    , lineHeight = Nothing
    , size = Nothing
    , style = Nothing
    , weight = Nothing
    }


{-| Quick function to create a basic font, specifying just the family and size
-}
create : String -> Int -> FontSpec
create family size =
    defaultFont
        |> setFamily family
        |> setSize size


{-| Set the font family to use - this follows the standard CSS font-family options
-}
setFamily : String -> FontSpec -> FontSpec
setFamily family font =
    { font | family = Just family }


{-| Set the height for each individual line of text
-}
setLineHeight : Float -> FontSpec -> FontSpec
setLineHeight lineHeight font =
    { font | lineHeight = Just lineHeight }


{-| Set the font size, in pixels
-}
setSize : Int -> FontSpec -> FontSpec
setSize size font =
    { font | size = Just size }


{-| Set the font style. Does not apply to titles. Follows the standard CSS font-style options.
-}
setStyle : String -> FontSpec -> FontSpec
setStyle style font =
    { font | style = Just style }


{-| Set the font weight. Follows the standard CSS font-weight options.
-}
setWeight : String -> FontSpec -> FontSpec
setWeight weight font =
    { font | weight = Just weight }

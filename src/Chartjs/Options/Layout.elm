module Chartjs.Options.Layout exposing (Layout(..))

{-| Types for managing layout configuration

@docs Layout
-} 

{-| Layout type 
-}
type Layout
    = Uniform Int
    | Specific { left : Int, right : Int, top : Int, bottom : Int }

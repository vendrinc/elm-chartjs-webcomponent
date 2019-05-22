module Chartjs.Options.Layout exposing (Layout(..))


type Layout
    = Uniform Int
    | Specific { left : Int, right : Int, top : Int, bottom : Int }

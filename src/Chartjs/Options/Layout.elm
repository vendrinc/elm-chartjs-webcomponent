module Chartjs.Options.Layout exposing (Layout(..))

{-| For more information, see <https://www.chartjs.org/docs/latest/configuration/layout.html>

@docs Layout

-}


{-| Controls the amount of padding inside the chart
By default, this is 0 on all sides

This can be set as either Uniform (applied to all sides)
or Specific (different paddings for each side)

-}
type Layout
    = Uniform Int
    | Specific { left : Int, right : Int, top : Int, bottom : Int }

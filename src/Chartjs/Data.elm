module Chartjs.Data exposing (DataSet(..), Data, defaultData)

{-| Types for choosing chart data

@docs DataSet, Data, defaultData
|-}

import Chartjs.DataSets.Bar as Bar
import Chartjs.DataSets.DoughnutAndPie as DoughnutAndPie
import Chartjs.DataSets.Line as Line


{-| DataSet |
-}
type DataSet
    = BarDataSet Bar.DataSet
    | LineDataSet Line.DataSet
    | DoughnutAndPieDataSet DoughnutAndPie.DataSet



-- todo: Datasets for Radar, Polar Area, Bubble, Scatter, Area, Mixed


{-| Data |
-}
type alias Data =
    { labels : List String
    , datasets : List DataSet
    }


{-| defaultData |
-}
defaultData : Data
defaultData =
    { labels = []
    , datasets = []
    }

module Chartjs.Data exposing (Data, DataSet(..), defaultData)

import Chartjs.DataSets.Bar as Bar
import Chartjs.DataSets.DoughnutAndPie as DoughnutAndPie
import Chartjs.DataSets.Line as Line


type DataSet
    = BarDataSet Bar.DataSet
    | LineDataSet Line.DataSet
    | DoughnutAndPieDataSet DoughnutAndPie.DataSet



-- todo: Datasets for Radar, Polar Area, Bubble, Scatter, Area, Mixed


type alias Data =
    { labels : List String
    , datasets : List DataSet
    }


defaultData : Data
defaultData =
    { labels = []
    , datasets = []
    }

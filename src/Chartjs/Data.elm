module Chartjs.Data exposing (Data, DataSet(..), buildData, defaultData)

import Chartjs.DataSets.Bar as Bar
import Chartjs.DataSets.DoughnutAndPie as DoughnutAndPie
import Chartjs.DataSets.Line as Line
import Chartjs.DataSets.Polar as Polar


type DataSet
    = BarDataSet Bar.DataSet
    | LineDataSet Line.DataSet
    | DoughnutAndPieDataSet DoughnutAndPie.DataSet
    | PolarDataSet Polar.DataSet



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


buildData : List String -> List DataSet -> Data
buildData labels datasets =
    { labels = labels
    , datasets = datasets
    }

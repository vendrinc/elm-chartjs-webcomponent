module Chartjs.Data exposing
    ( Data
    , DataSet(..)
    , addDataset
    , buildData
    , dataFromLabels
    , defaultData
    )

import Chartjs.DataSets.Bar as Bar
import Chartjs.DataSets.DoughnutAndPie as DoughnutAndPie
import Chartjs.DataSets.Line as Line
import Chartjs.DataSets.Polar as Polar


type DataSet
    = BarData Bar.DataSet
    | LineData Line.DataSet
    | PieData DoughnutAndPie.DataSet
    | PolarData Polar.DataSet


type alias Data =
    { labels : List String
    , datasets : List DataSet
    }


defaultData : Data
defaultData =
    { labels = []
    , datasets = []
    }


dataFromLabels : List String -> Data
dataFromLabels labels =
    buildData labels []


buildData : List String -> List DataSet -> Data
buildData labels datasets =
    { labels = labels
    , datasets = datasets
    }


addDataset : DataSet -> Data -> Data
addDataset dataset data =
    let
        newDatasets =
            dataset :: data.datasets
    in
    { data | datasets = newDatasets }

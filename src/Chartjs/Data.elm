module Chartjs.Data exposing
    ( DataSet(..), Data, defaultData
    , dataFromLabels, buildData, addDataset, setDatasets
    )

{-| The Data type is used as a basic container for all the chart datasets,
along with the corresponding labels

@docs DataSet, Data, defaultData

@docs dataFromLabels, buildData, addDataset, setDatasets

-}

import Chartjs.DataSets.Bar as Bar
import Chartjs.DataSets.DoughnutAndPie as DoughnutAndPie
import Chartjs.DataSets.Line as Line
import Chartjs.DataSets.Polar as Polar


{-| Type wrapper for an individual dataset

While this type should match the overall chart type,
it is possible to put multiple types of dataset on one chart

-}
type DataSet
    = BarData Bar.DataSet
    | LineData Line.DataSet
    | PieData DoughnutAndPie.DataSet
    | PolarData Polar.DataSet


{-| All datasets for a chart are contained in a single Data object
This also specifies the category labels, which are shared across datasets
(eg. multiple bar charts with the same categories)
-}
type alias Data =
    { labels : List String
    , datasets : List DataSet
    }


{-| Data object with no labels or datasets defined
-}
defaultData : Data
defaultData =
    { labels = []
    , datasets = []
    }


{-| Data object with specified labels but no datasets
-}
dataFromLabels : List String -> Data
dataFromLabels labels =
    buildData labels []


{-| Build a Data object from a list of labels and a list of datasets
-}
buildData : List String -> List DataSet -> Data
buildData labels datasets =
    { labels = labels
    , datasets = datasets
    }


{-| Add a dataset to a Data object
This is very useful for use with the |> operator

    defaultData
        |> addDataset dataset1
        |> addDataset dataset2

-}
addDataset : DataSet -> Data -> Data
addDataset dataset data =
    let
        newDatasets =
            dataset :: data.datasets
    in
    { data | datasets = newDatasets }


{-| Set all the datasets for a Data object
-}
setDatasets : List DataSet -> Data -> Data
setDatasets datasets data =
    { data | datasets = datasets }

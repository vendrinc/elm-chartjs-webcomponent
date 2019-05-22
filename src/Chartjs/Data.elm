module Chartjs.Data exposing (Data, DataSet(..), defaultData, encodeData, encodeDataset)

import Json.Encode as Encode
import Chartjs.DataSets.Bar as Bar
import Chartjs.DataSets.DoughnutAndPie as DoughnutAndPie
import Chartjs.DataSets.Line as Line
import Chartjs.Util as Encode

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


encodeData : Data -> Encode.Value
encodeData data =
    Encode.beginObject
        |> Encode.listField "labels" Encode.string data.labels
        |> Encode.listField "datasets" encodeDataset data.datasets
        |> Encode.toValue


encodeDataset : DataSet -> Encode.Value
encodeDataset dataSet =
    case dataSet of
        BarDataSet barChartDataSet ->
            Bar.encodeBarChartDataSet barChartDataSet

        LineDataSet lineChartDataSet ->
            Line.encodeLineChartDataSet lineChartDataSet

        DoughnutAndPieDataSet doughnutAndPieDataSet ->
            DoughnutAndPie.encodeDoughnutAndPieDataSet doughnutAndPieDataSet

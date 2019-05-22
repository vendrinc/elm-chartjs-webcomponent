module Chartjs.Options.Legend exposing (Labels, Legend, defaultLabels, defaultLegend)

import Chartjs.Common as Common
import Color exposing (Color)


type alias Legend =
    { display : Maybe Bool
    , position : Maybe Common.Position
    , fullWidth : Maybe Bool
    , -- onClick,
      -- onHover,
      reverse : Maybe Bool
    , labels : Maybe Labels
    }


type alias Labels =
    { boxWidth : Maybe Int
    , fontSize : Maybe Int
    , fontStyle : Maybe String
    , fontColor : Maybe Color
    , fontFamily : Maybe String
    , padding : Maybe Int
    , --generate labels,
      --filter,
      usePointStyle : Maybe Bool
    }


defaultLegend : Legend
defaultLegend =
    { display = Nothing
    , position = Nothing
    , fullWidth = Nothing
    , reverse = Nothing
    , labels = Nothing
    }


defaultLabels : Labels
defaultLabels =
    { boxWidth = Nothing
    , fontSize = Nothing
    , fontStyle = Nothing
    , fontColor = Nothing
    , fontFamily = Nothing
    , padding = Nothing
    , --generate labels,
      --filter,
      usePointStyle = Nothing
    }

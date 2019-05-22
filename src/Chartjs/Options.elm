module Chartjs.Options exposing (Options, defaultOptions)

import Chartjs.Options.Animations as Animations
import Chartjs.Options.Elements as Elements
import Chartjs.Options.Layout as Layout
import Chartjs.Options.Legend as Legend
import Chartjs.Options.Scales as Scales
import Chartjs.Options.Title as Title
import Chartjs.Options.Tooltips as Tooltips


type alias Options =
    { animations : Maybe Animations.Animations
    , layout : Maybe Layout.Layout
    , legend : Maybe Legend.Legend
    , title : Maybe Title.Title
    , tooltips : Maybe Tooltips.Tooltips
    , elements : Maybe Elements.Elements
    , scales : Maybe Scales.Scales
    , maintainAspectRatio : Maybe Bool
    }


defaultOptions : Options
defaultOptions =
    { animations = Nothing
    , layout = Nothing
    , legend = Nothing
    , title = Nothing
    , tooltips = Nothing
    , elements = Nothing
    , scales = Nothing
    , maintainAspectRatio = Nothing
    }

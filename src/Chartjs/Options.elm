module Chartjs.Options exposing (Options, defaultOptions, encodeOptions)

import Json.Encode as Encode
import Chartjs.Options.Animations as Animations
import Chartjs.Options.Elements as Elements
import Chartjs.Options.Layout as Layout
import Chartjs.Options.Legend as Legend
import Chartjs.Options.Scales as Scales
import Chartjs.Options.Title as Title
import Chartjs.Options.Tooltips as Tooltips
import Chartjs.Util as Encode


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


encodeOptions : Options -> Encode.Value
encodeOptions options =
    Encode.beginObject
        |> Encode.maybeCustomField "animations" Animations.encodeAnimations options.animations
        |> Encode.maybeCustomField "layout" Layout.encodeLayout options.layout
        |> Encode.maybeCustomField "legend" Legend.encodeLegend options.legend
        |> Encode.maybeCustomField "title" Title.encodeTitle options.title
        |> Encode.maybeCustomField "tooltips" Tooltips.encodeTooltips options.tooltips
        |> Encode.maybeCustomField "elements" Elements.encodeElements options.elements
        |> Encode.maybeCustomField "scales" Scales.encodeScales options.scales
        |> Encode.maybeBoolField "maintainAspectRatio" options.maintainAspectRatio
        |> Encode.toValue

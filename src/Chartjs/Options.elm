module Chartjs.Options exposing
    ( Options
    , defaultOptions
    , setAnimations
    , setElements
    , setLayout
    , setLegend
    , setMaintainAspectRatio
    , setResponsive
    , setScales
    , setTitle
    , setTooltips
    )

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
    , responsive : Maybe Bool
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
    , responsive = Nothing
    }


setAnimations : Animations.Animations -> Options -> Options
setAnimations animations options =
    { options | animations = Just animations }


setLayout : Layout.Layout -> Options -> Options
setLayout layout options =
    { options | layout = Just layout }


setLegend : Legend.Legend -> Options -> Options
setLegend legend options =
    { options | legend = Just legend }


setTitle : Title.Title -> Options -> Options
setTitle title options =
    { options | title = Just title }


setTooltips : Tooltips.Tooltips -> Options -> Options
setTooltips tooltips options =
    { options | tooltips = Just tooltips }


setElements : Elements.Elements -> Options -> Options
setElements elements options =
    { options | elements = Just elements }


setScales : Scales.Scales -> Options -> Options
setScales scales options =
    { options | scales = Just scales }


setMaintainAspectRatio : Bool -> Options -> Options
setMaintainAspectRatio maintainAspectRatio options =
    { options | maintainAspectRatio = Just maintainAspectRatio }


setResponsive : Bool -> Options -> Options
setResponsive responsive options =
    { options | responsive = Just responsive }

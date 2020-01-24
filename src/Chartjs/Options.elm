module Chartjs.Options exposing
    ( Options, defaultOptions
    , setAnimations, setElements, setLayout, setLegend, setMaintainAspectRatio, setResponsive, setScales, setTitle, setTooltips
    )

{-| The Options type is used for configuring how the chart behaves
This contains properties to control things like styling, fonts, etc.

@docs Options, defaultOptions

@docs setAnimations, setElements, setLayout, setLegend, setMaintainAspectRatio, setResponsive, setScales, setTitle, setTooltips

-}

import Chartjs.Options.Animations as Animations
import Chartjs.Options.Elements as Elements
import Chartjs.Options.Layout as Layout
import Chartjs.Options.Legend as Legend
import Chartjs.Options.Scales as Scales
import Chartjs.Options.Title as Title
import Chartjs.Options.Tooltips as Tooltips


{-| These options are applied to the whole chart and not an individual dataset
-}
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
    , cutoutPercentage : Maybe Int
    , rotation : Maybe Float
    , circumference : Maybe Float
    }


{-| Creates a blank options structure which can then be edited using the below set functions
-}
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
    , cutoutPercentage = Nothing
    , rotation = Nothing
    , circumference = Nothing
    }


{-| Set the animations property
-}
setAnimations : Animations.Animations -> Options -> Options
setAnimations animations options =
    { options | animations = Just animations }


{-| Set the layout property
-}
setLayout : Layout.Layout -> Options -> Options
setLayout layout options =
    { options | layout = Just layout }


{-| Set the legend property
-}
setLegend : Legend.Legend -> Options -> Options
setLegend legend options =
    { options | legend = Just legend }


{-| Set the title property
-}
setTitle : Title.Title -> Options -> Options
setTitle title options =
    { options | title = Just title }


{-| Set the tootlips property
-}
setTooltips : Tooltips.Tooltips -> Options -> Options
setTooltips tooltips options =
    { options | tooltips = Just tooltips }


{-| Set the elements property
-}
setElements : Elements.Elements -> Options -> Options
setElements elements options =
    { options | elements = Just elements }


{-| Set the scales property
-}
setScales : Scales.Scales -> Options -> Options
setScales scales options =
    { options | scales = Just scales }


{-| Set whether to keep the aspect ratio of this chart consistent
-}
setMaintainAspectRatio : Bool -> Options -> Options
setMaintainAspectRatio maintainAspectRatio options =
    { options | maintainAspectRatio = Just maintainAspectRatio }


{-| Set whether this chart should be responsive
Note: there is currently no parameters to directly set the width and hieght of the chart
I strongly recommend sizing the parent web component and leaving this option enabled
-}
setResponsive : Bool -> Options -> Options
setResponsive responsive options =
    { options | responsive = Just responsive }


{-| Set the cutout percentage of this chart.
By default, Doughnuts are 50 and Pies are 0
-}
setCutoutPercentage : Int -> Options -> Options
setCutoutPercentage percentage options =
    { options | cutoutPercentage = Just percentage }


{-| Set the starting angle (in radians) to draw arcs from
-}
setRotation : Float -> Options -> Options
setRotation rotation options =
    { options | rotation = Just rotation }


{-| Set the sweep (in radians) that arcs are allowed to cover
-}
setCircumference : Float -> Options -> Options
setCircumference circumference options =
    { options | circumference = Just circumference }

module Chartjs.Options.Animations exposing
    ( Animations, defaultAnimations
    , Easing(..), setEasing
    , setDuration, setAnimateRotate, setAnimateScale
    )

{-| These options are provided to help configure how the animation functions
By default, the chart should automatically animate updates good enough for most use cases

For more information, see <https://www.chartjs.org/docs/latest/configuration/animations.html>

@docs Animations, defaultAnimations
@docs Easing, setEasing
@docs setDuration, setAnimateRotate, setAnimateScale

-}


{-| Different easings for animations
To see examples of these easings, see <https://easings.net>
-}
type Easing
    = EaseLinear
    | EaseInQuad
    | EaseOutQuad
    | EaseInOutQuad
    | EaseInCubic
    | EaseOutCubic
    | EaseInOutCubic
    | EaseInQuart
    | EaseOutQuart
    | EaseInOutQuart
    | EaseInQuint
    | EaseOutQuint
    | EaseInOutQuint
    | EaseInSine
    | EaseOutSine
    | EaseInOutSine
    | EaseInExpo
    | EaseOutExpo
    | EaseInOutExpo
    | EaseInCirc
    | EaseOutCirc
    | EaseInOutCirc
    | EaseInElastic
    | EaseOutElastic
    | EaseInOutElastic
    | EaseInBack
    | EaseOutBack
    | EaseInOutBack
    | EaseInBounce
    | EaseOutBounce
    | EaseInOutBounce


{-| todo
-}
type alias Animations =
    { duration : Maybe Int
    , easing : Maybe Easing
    , -- onProgress: Maybe (Animation -> msg),
      -- onComplete: Maybe (Animation -> msg),
      animateRotate : Maybe Bool
    , -- If true, the chart will animate in with a rotation animation.
      animateScale : Maybe Bool -- If true, will animate scaling the chart from the center outwards.
    }



{-
   type alias Animation =
       { -- not yet implemeted
         ------------------------
         -- // Chart object
         -- chart: Chart,
         -- // Current Animation frame number
         -- currentStep: Number,
         -- // Number of animation frames
         -- numSteps: Number,
         -- // Animation easing to use
         -- easing: String,
         -- // Function that renders the chart
         -- render: Function,
         -- // User callback
         -- onAnimationProgress: Function,
         -- // User callback
         -- onAnimationComplete: Function
       }
-}


{-| -}
defaultAnimations : Animations
defaultAnimations =
    { duration = Nothing
    , easing = Nothing
    , animateRotate = Nothing
    , animateScale = Nothing
    }


{-| Time (in milliseconds) an animation takes
-}
setDuration : Int -> Animations -> Animations
setDuration duration animations =
    { animations | duration = Just duration }


{-| Easing function to use
-}
setEasing : Easing -> Animations -> Animations
setEasing easing animations =
    { animations | easing = Just easing }


{-| Used for Pie charts
-}
setAnimateRotate : Bool -> Animations -> Animations
setAnimateRotate bool animations =
    { animations | animateRotate = Just bool }


{-| Used for Pie charts
-}
setAnimateScale : Bool -> Animations -> Animations
setAnimateScale bool animations =
    { animations | animateScale = Just bool }

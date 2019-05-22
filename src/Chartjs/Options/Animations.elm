module Chartjs.Options.Animations exposing (Animation, Animations, Easing(..), defaultAnimations)


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


type alias Animations =
    { duration : Maybe Int
    , easing : Maybe Easing
    , -- onProgress: Maybe (Animation -> msg),
      -- onComplete: Maybe (Animation -> msg),
      animateRotate : Maybe Bool
    , -- If true, the chart will animate in with a rotation animation.
      animateScale : Maybe Bool -- If true, will animate scaling the chart from the center outwards.
    }


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


defaultAnimations : Animations
defaultAnimations =
    { duration = Nothing
    , easing = Nothing
    , animateRotate = Nothing
    , animateScale = Nothing
    }

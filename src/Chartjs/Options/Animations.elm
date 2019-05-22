module Chartjs.Options.Animations exposing (Animation, Animations, Easing(..), defaultAnimations, encodeAnimations, encodeEasing)

import Json.Encode as Encode
import Chartjs.Util as Encode

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


encodeAnimations : Animations -> Encode.Value
encodeAnimations animations =
    Encode.beginObject
        |> Encode.maybeIntField "duration" animations.duration
        |> Encode.maybeCustomField "easing" encodeEasing animations.easing
        |> Encode.maybeBoolField "animateRotate" animations.animateRotate
        |> Encode.maybeBoolField "animateScale" animations.animateScale
        |> Encode.toValue


encodeEasing : Easing -> Encode.Value
encodeEasing easing =
    (case easing of
        EaseLinear ->
            "linear "

        EaseInQuad ->
            "easeInQuad "

        EaseOutQuad ->
            "easeOutQuad "

        EaseInOutQuad ->
            "easeInOutQuad "

        EaseInCubic ->
            "easeInCubic "

        EaseOutCubic ->
            "easeOutCubic "

        EaseInOutCubic ->
            "easeInOutCubic "

        EaseInQuart ->
            "easeInQuart "

        EaseOutQuart ->
            "easeOutQuart "

        EaseInOutQuart ->
            "easeInOutQuart "

        EaseInQuint ->
            "easeInQuint "

        EaseOutQuint ->
            "easeOutQuint "

        EaseInOutQuint ->
            "easeInOutQuint "

        EaseInSine ->
            "easeInSine "

        EaseOutSine ->
            "easeOutSine "

        EaseInOutSine ->
            "easeInOutSine "

        EaseInExpo ->
            "easeInExpo "

        EaseOutExpo ->
            "easeOutExpo "

        EaseInOutExpo ->
            "easeInOutExpo "

        EaseInCirc ->
            "easeInCirc "

        EaseOutCirc ->
            "easeOutCirc "

        EaseInOutCirc ->
            "easeInOutCirc "

        EaseInElastic ->
            "easeInElastic "

        EaseOutElastic ->
            "easeOutElastic "

        EaseInOutElastic ->
            "easeInOutElastic "

        EaseInBack ->
            "easeInBack "

        EaseOutBack ->
            "easeOutBack "

        EaseInOutBack ->
            "easeInOutBack "

        EaseInBounce ->
            "easeInBounce "

        EaseOutBounce ->
            "easeOutBounce "

        EaseInOutBounce ->
            "easeInOutBounce "
    )
        |> Encode.string

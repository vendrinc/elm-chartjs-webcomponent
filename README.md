# blissfully/elm-chartjs-webcomponent

[Chartjs](https://www.chartjs.org/) is a robust, featureful Javascript charting library. This repo provides a type-safe bridge from Elm, to a web-component mounted Chartjs canvas.

There are two steps to using this library effectively:

1. Include `elm install blissfully/elm-chartjs-webcomponent` in your Elm project.
2. Addd Chartjs to your Javascript pipeline or HTML includes. (Known to work with `chartjs@2.7.3`)
3. `npm install @blissfully/elm-chartjs-webcomponent` and include the `webcomponent/chartjs.js` in your Javascript build pipeline.

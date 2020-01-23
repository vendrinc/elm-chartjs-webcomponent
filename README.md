# indicatrix/elm-chartjs-webcomponent
### forked from [blissfully/elm-chartjs-webcomponent](https://github.com/blissfully/elm-chartjs-webcomponent/)

[Chartjs](https://www.chartjs.org/) is a robust, featureful Javascript charting library. This module provides Elm types which work in conjunction with a web-component. While there are some limitations to this, this module should provide enough functionality for the majority of charts to work.

## Getting Started
The first step is to add the webcomponent.
Grab this from npm:

```npm install [TBD]```

then include `webcomponent/chartjs.js` as part of your JS build pipeline. Keep in mind that web components are still relatively new web technologies - for best compatibility, you'll need to use a [polyfill](https://github.com/webcomponents/polyfills).

Once the web component is setup, you're pretty much good to go! Don't forget to install this Elm library:

```elm install indicatrix/elm-chartjs-webcomponent```

## Documentation
When in doubt, consult the [Chart.js documentation](https://www.chartjs.org/docs/latest/).

Documentation specific for this library can be found on Elm Packages [here](https://package.elm-lang.org/packages/indicatrix/elm-chartjs-webcomponent/latest/).

The most useful thing to know is that this library makes heavy use of pipeline operators. Instead of directly using record update syntax, pipeline operators can make your code significantly cleaner.

An example:
```elm
    Data.dataFromLabels model.labels
        |> Data.addDataset BarData
            (BarData.defaultBarFromData "Example Chart" data
                |> BarData.setBackgroundColor (Common.All colors)
                |> BarData.setBorderColor (Common.All Color.white)
            )
        |> Data.addDataset LineData
            (LineData.defaultLineFromData "Line Chart" data2
                |> LineData.setFill Disabled
                |> LineData.setBorderColor (Common.All Color.white)
            )
```

Some basic examples are included in this repository under the **examples/** directory. However, adding the web component to these is left as an exercise for the reader. Good luck.
import '@indicatrix/elm-chartjs-webcomponent';
import { Elm as E1 } from './src/SimpleBarChart.elm';
import { Elm as E2 } from './src/PieChartWithOptions.elm';
import { Elm as E3 } from './src/StackedGroupedBarChart.elm';
import { Elm as E4 } from './src/MixedChart.elm';
import { Elm as E5 } from './src/UpdatingChart.elm';
import { Elm as E6 } from './src/ScatterChart.elm';

E1.SimpleBarChart.init( { node: document.getElementById('example1') } );
E2.PieChartWithOptions.init( { node: document.getElementById('example2') } );
E3.StackedGroupedBarChart.init( { node: document.getElementById('example3') } );
E4.MixedChart.init( { node: document.getElementById('example4') } );
E5.UpdatingChart.init( { node: document.getElementById('example5') } );
E6.ScatterChart.init( { node: document.getElementById('example6') } );
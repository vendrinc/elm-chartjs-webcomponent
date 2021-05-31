import '@indicatrix/elm-chartjs-webcomponent';
import { Elm as E1 } from './src/SimpleBarChart.elm';
import { Elm as E2 } from './src/UpdatingChart.elm';

E1.SimpleBarChart.init( { node: document.getElementById('example1') } );
E2.UpdatingChart.init( { node: document.getElementById('example2') } );
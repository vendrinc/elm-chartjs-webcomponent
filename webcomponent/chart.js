/*
 This is a major stripped down version of the original web component
 This one properly creates the chart & updates the chart property settings
 However there is no support for setting callback functions at this stage
*/
import Chart from 'chart.js';

class ChartjsChart extends window.HTMLElement {
  constructor() {
    const self = super()
    this._chartConfig = {}
    return self
  }

  connectedCallback() {
    let canvas = document.createElement("canvas")
    this._canvas = canvas
    this.appendChild(canvas)

    const ctx = canvas.getContext("2d")
    this.style.display = "block"
    this._chart = new Chart(ctx, this._chartConfig)
  }

  set chartConfig(newValue) {
    this._chartConfig = newValue

    if(this._chart) {
      const newDatasets = newValue.data.datasets
      const oldDatasets = this._chart.data.datasets

      // Update all datasets
      for(let i=0; i < newDatasets.length; i++) {
        // Copying the meta will keep the animations between them smooth
        newDatasets[i]._meta = oldDatasets[i]._meta
        oldDatasets[i] = newDatasets[i]
      }

      // Update options and then call ChartJs update
      this._chart.options = newValue.options
      this._chart.update()
    }
  }
}

window.customElements.define('chart-component', ChartjsChart)

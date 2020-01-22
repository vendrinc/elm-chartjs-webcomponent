/*
 This is a major stripped down version of the original web component
 This one properly creates the chart & updates the chart property settings
 However there is no support for setting option functions at this stage
*/
import Chart from 'chart.js';

class ChartjsChart extends window.HTMLElement {
  constructor() {
    const self = super()
    this._chartConfig = {}
    return self
  }

  connectedCallback() {
    this.style.width = "380px"
    this.style.height = "380px"

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
      // Updating the dataset causes the animations to be unsatisfactory
      this._chart.data.datasets[0].data = newValue.data.datasets[0].data
      this._chart.data.datasets[0].label = newValue.data.datasets[0].label
      this._chart.options = newValue.options
      this._chart.update()
    }
  }
}

window.customElements.define('chart-component', ChartjsChart)

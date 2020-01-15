/*
 This is a major stripped down version of the original web component
 This one properly creates the chart & updates the chart property settings
 However there is no support for setting option functions at this stage
*/
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
      this._chart.update()
    }
  }
}

window.customElements.define('chart-component', ChartjsChart)

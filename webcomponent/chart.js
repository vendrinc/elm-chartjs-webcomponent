/*
 This is a simple implementation of a ChartJs web component
 This should handle resizing, data updates, and options as expected

 For more advanced functionality, consider using native JS instead of Elm
*/
import Chart from 'chart.js'

class ChartjsChart extends window.HTMLElement {
  constructor () {
    const self = super()
    this._chartConfig = {}
    return self
  }

  connectedCallback () {
    const canvas = document.createElement('canvas')
    this._canvas = canvas
    this.appendChild(canvas)

    const ctx = canvas.getContext('2d')
    this.style.display = 'block'
    this._chart = new Chart(ctx, this._chartConfig)
  }

  set chartConfig (newValue) {
    this._chartConfig = newValue

    if (this._chart) {
      const newDatasets = newValue.data.datasets
      const oldDatasets = this._chart.data.datasets

      // Update all datasets
      for (let i = 0; i < newDatasets.length; i++) {
        // Copying the meta will keep the animations between them smooth
        if(oldDatasets[i]) {
          newDatasets[i]._meta = oldDatasets[i]._meta
        }
        oldDatasets[i] = newDatasets[i]
      }

      // Update options and then call ChartJs update
      this._chart.options = newValue.options
      this._chart.update()
    }
  }
}

window.customElements.define('chart-component', ChartjsChart)

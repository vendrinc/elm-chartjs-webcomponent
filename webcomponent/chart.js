/*
 This is a simple implementation of a ChartJs web component
 This should handle resizing, data updates, and options as expected

 For more advanced functionality, consider using native JS instead of Elm
*/
import Chart from 'chart.js/auto'

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

  // Replace a dataset without causing chart.js to think we've demolished it
  safeReplaceDataset(oldDataset, newDataset) {
    oldDataset.data = newDataset.data
    oldDataset.labels = newDataset.labels
  }

  set chartConfig (newValue) {
    this._chartConfig = newValue

    if (this._chart) {
      const oldDatasets = this._chart.data.datasets
      const newDatasets = newValue.data.datasets

      // Carefully update datasets
      for(let i = 0; i < oldDatasets.length; i++) {
        console.log(i, oldDatasets.length, newDatasets.length)
        if(i >= newDatasets.length) break
        this.safeReplaceDataset(oldDatasets[i], newDatasets[i])
      }

      // Remove old datasets
      while(oldDatasets.length > newDatasets.length) {
        oldDatasets.pop()
      }

      // Add new datasets
      while (newDatasets.length > oldDatasets.length) {
        oldDatasets.push(newDatasets[oldDatasets.length])
      }

      // Update options and then call ChartJs update
      this._chart.options = newValue.options
      this._chart.update()
    }
  }
}

window.customElements.define('chart-component', ChartjsChart)
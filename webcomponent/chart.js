/*
 This is a simple implementation of a ChartJs web component
 This should handle resizing, data updates, and options as expected

 For more advanced functionality, consider using native JS instead of Elm
*/
import Chart from 'chart.js/auto';

// Update any keys in an existing object with a new object
// Any keys in the old object but not in the new object will be left untouched
function safeReplaceObject(oldObj, newObj) {
  Object.keys(newObj).forEach(key => {
    oldObj[key] = newObj[key]
  })
}

// Preprocess a config
// This turns some of our fancy elm objects into neat callback functions, giving us finer control over labels etc.
function preprocessConfig(config) {
  if (!config.options) return

  // Callbacks for tooltips
  if (config.options.plugins && config.options.plugins.tooltip) {
    const tooltipConfig = config.options.plugins.tooltip
    tooltipConfig.callbacks = tooltipConfig.callbacks || {}

    if (tooltipConfig.labelFormat) {
      generateTooltipLabelCallbackFunction(tooltipConfig.labelFormat, tooltipConfig)
    }

    if (tooltipConfig.footerText) {
      tooltipConfig.callbacks.footer = function() { return tooltipConfig.footerText }
    }
  }

  // Generate callback functions for any scales with a tick format specified
  if (config.options.scales) {
    Object.values(config.options.scales).forEach(function(scaleConfig) {
      if (scaleConfig.ticks && scaleConfig.ticks.tickFormat) {
        generateScaleTickCallbackFunction(scaleConfig.ticks.tickFormat, scaleConfig.ticks)
      }
    })
  }
}

// Generate a callback function for a tooltip label
function generateTooltipLabelCallbackFunction(labelFormat, config) {
  if (labelFormat.prefix) { 
    // Add a prefix to the tooltip labels
    config.callbacks.label = function(context) {
      let label = context.dataset.label || ''
      if (label) {
        label += ': '
      }

      if (context.parsed.y !== null) {
        label += labelFormat.prefix + context.parsed.y 
      }
      return label
    }
  } else if (labelFormat.suffix) {
    // Add a suffix to the tooltip labels
    config.callbacks.label = function(context) {
      let label = context.dataset.label || ''
      if (label) {
        label += ': '
      }

      if (context.parsed.y !== null) {
        label += context.parsed.y + labelFormat.suffix
      }
      return label
    }
  }
}

// Generate a callback function for a scale tick
function generateScaleTickCallbackFunction(tickFormat, config) {
  if (tickFormat.prefix) {
    config.callback = function(value, _, _) { return tickFormat.prefix + value }
  } else if (tickFormat.suffix) {
    config.callback = function(value, _, _) { return value + tickFormat.suffix }
  }
}

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
    preprocessConfig(newValue)
    this._chartConfig = newValue

    if (this._chart) {
      const oldDatasets = this._chart.data.datasets
      const newDatasets = newValue.data.datasets

      // Carefully update datasets
      for(let i = 0; i < oldDatasets.length; i++) {
        if(i >= newDatasets.length) break
        safeReplaceObject(oldDatasets[i], newDatasets[i])
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
      safeReplaceObject(this._chart.options, newValue.options)
      this._chart.update()
    }
  }
}

function registerChartComponent() {
  window.customElements.define('chart-component', ChartjsChart)
}

registerChartComponent()
export { Chart, registerChartComponent }
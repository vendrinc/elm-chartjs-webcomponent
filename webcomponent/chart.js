Chart.defaults.global.defaultFontFamily = "'Lato', sans-serif"

const updateValueAtPath = (propertyPath, f, obj) => {
  // this is a super simple parsing, you will want to make this more complex to handle correctly any path
  // it will split by the dots at first and then simply pass along the array (on next iterations)
  let properties = Array.isArray(propertyPath) ? propertyPath : propertyPath.split(".")

  var propertyName = properties[0]
  const isArrayProperty = propertyName.endsWith("[]")
  if (isArrayProperty) {
    propertyName = propertyName.substring(0, propertyName.length - 2)
  }

  // Not yet at the last property so keep digging
  if (properties.length > 1) {
    // The property doesn't exists OR is not an object we punt
    if (!obj.hasOwnProperty(propertyName) || typeof obj[propertyName] !== "object") {
      return
      // We could have auto created by: obj[propertyName] = {}
      // and not returning
    }

    // We iterate.
    if (isArrayProperty) {
      // if it's an array, we iterate on all the elements!
      const arrayElems = obj[propertyName]

      for (let index in arrayElems) {
        updateValueAtPath(properties.slice(1), f, arrayElems[index])
      }

      return true
    } else {
      // not array, do normal recursion
      return updateValueAtPath(properties.slice(1), f, obj[propertyName])
    }
  } else if (obj.hasOwnProperty(propertyName)) {
    // We update the value according to the func
    obj[propertyName] = f(obj[propertyName])
    return true // this is the end
  }
}

// some help funcs for eval'd code
// The marshal'd down code expects this to be in global scope
// Given newly well-scoped assets, force to global manually
window.numberWithCommas = x => {
  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
}

customElements.define(
  "chart-component",
  class extends HTMLElement {
    constructor() {
      super()
    }

    set chartWidth(newValue) {
      this.setAttribute("chartWidth", newValue)
    }

    set chartHeight(newValue) {
      this.setAttribute("chartHeight", newValue)
    }

    set chartConfig(newValue) {
      this._chartConfig = newValue
      // Because we can't marshal code across Elm<->JS boundaries,
      // we marshal function-body strings instead, and using `Function`,
      // turn those into non-global, anonymous functions at the approrpriate
      // location in the chart config datastructure. As long as Elm only outputs
      // non-UGC strings, we'll be ok security wise
      updateValueAtPath(
        "options.tooltips.callbacks.label",
        code => new Function("tooltipItem", "data", code),
        this._chartConfig
      )
      updateValueAtPath(
        "options.scales.yAxes[].ticks.callback",
        code => new Function("value", "index", "values", code),
        this._chartConfig
      )
    }

    connectedCallback() {
      let canvasContainer = document.createRange().createContextualFragment(`
      <div
        class="chart-container"
        style="position: relative; min-height: ${this.getAttribute("chartHeight")}px"
      >
        <canvas
        ></canvas>
      </div>
    `)

      this.appendChild(canvasContainer)
      const canvas = this.getElementsByTagName("canvas")[0]
      const ctx = canvas.getContext("2d")
      this._chart = new Chart(ctx, this._chartConfig)
    }
  }
)

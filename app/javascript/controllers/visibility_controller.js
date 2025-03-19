import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="visibility"
export default class extends Controller {
  static classes = ["shown"]
  connect() {}

  show() {
    this.element.classList.toggle(this.shownClass)
  }
}

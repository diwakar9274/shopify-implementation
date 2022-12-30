import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"
export default class extends Controller {
  static get targets() {
    return ["form"]
  }

  submit(event) {
    this.formTarget.requestSubmit()
  }
}
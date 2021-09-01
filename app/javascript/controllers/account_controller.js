import { event } from "jquery"
import { Controller } from "stimulus"

export default class extends Controller {

static targets = ["list"]

  connect() {
    console.log("I am connected")
  }
  account() {
    console.log(this.listTarget.id)
  }
}

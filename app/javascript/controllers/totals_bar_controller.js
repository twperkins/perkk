import { Controller } from "stimulus"



export default class extends Controller {

  static targets = ["totals"]

  connect() {
    console.log("totals_bar is also connected")
  }

  total() {
    // console.log(this.totalsTarget.innerText)

    fetch('/package')
      .then(response => response.json())
      .then(data => this.totalsTarget.innerText = data);

  }
}

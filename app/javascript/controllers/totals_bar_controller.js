import { Controller } from "stimulus"



export default class extends Controller {

  static targets = ["totals","available"]

  connect() {
    console.log("totals_bar is also connected")
  }

  total() {
    // console.log(this.availableTarget)
    // console.log(this.totalsTarget)

    fetch('/package')
      .then(response => response.json())
      .then(data => {this.availableTarget.innerText = data["available_perks"];
        this.totalsTarget.innerText = data["total_perks"];
        console.log(data["total_perks"]);
        console.log(data["available_perks"]);
    });
  }


}

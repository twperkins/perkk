import { Controller } from 'stimulus';
// import { Application } from "stimulus"
// import ScrollTo from "stimulus-scroll-to"

// const application = Application.start()
// application.register("scroll-to", ScrollTo)

export default class extends Controller {
  static targets = ['scroll-to'];

  connect() {
    console.log("connected");
  }
  scrollPage() {
    var mainCircle = document.getElementById('scroll-circle');
    mainCircle.scrollIntoView({ behavior: 'smooth' });
  }
}

import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['popout', 'form', 'button'];

  connect() {
    console.log(this.formTarget);
  }
  toggleLogin() {
    this.popoutTarget.classList.toggle('expanded');
    this.formTarget.classList.toggle('d-none');
    this.buttonTarget.classList.toggle('button-right');
    this.buttonTarget.classList.toggle('button-left');
  }

}
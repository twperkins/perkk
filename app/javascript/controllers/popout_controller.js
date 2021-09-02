import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['popout', 'form', 'button'];

  connect() {
    console.log('connected');
  }
  toggleLogin() {
    console.log('clicked');
    this.popoutTarget.classList.toggle('expanded-login');
    this.formTarget.classList.toggle('d-none');
    this.buttonTarget.classList.toggle('button-right');
    this.buttonTarget.classList.toggle('button-left');
  }
}

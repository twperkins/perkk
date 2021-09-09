import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['overlay', 'profileDetails', 'button'];

  connect() {
    console.log('connected');
  }
  nextPerk() {
    console.log('clicked')
    this.overlayTarget.classList.toggle('expanded-overlay');
    this.profileDetailsTarget.classList.toggle('d-none');
    this.buttonTarget.classList.toggle('button-right');
    this.buttonTarget.classList.toggle('button-left');
  }
}

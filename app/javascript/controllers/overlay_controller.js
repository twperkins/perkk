import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['overlay', 'profile-details', 'button'];

  connect() {
    console.log('connected');
  }
  toggleOverlay() {
    console.log('clicked')
    this.overlayTarget.classList.toggle('expanded-overlay');
    this.profileDetailsTarget.classList.toggle('d-none');
    this.buttonTarget.classList.toggle('button-right');
    this.buttonTarget.classList.toggle('button-left');
  }
}
